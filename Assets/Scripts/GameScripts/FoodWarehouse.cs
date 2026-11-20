using UnityEngine;
using UnityEngine.InputSystem;

public class FoodWarehouse : Food
{
	private int MaxFoodValue = 999;

	[ExtraData("resource_id")]
	[HideInInspector]
	public string HeldCardId = "";

	public override bool DetermineCanHaveCardsWhenIsRoot => true;

	protected override bool CanHaveCard(CardData otherCard)
	{
		if (otherCard is Food { FoodValue: >0 })
		{
			if (string.IsNullOrEmpty(HeldCardId))
			{
				return true;
			}
			if (!string.IsNullOrEmpty(HeldCardId) && otherCard.Id == HeldCardId)
			{
				return true;
			}
			return false;
		}
		return false;
	}

	public override bool CanHaveCardsWhileHasStatus()
	{
		return true;
	}

	public override void UpdateCard()
	{
		MyGameCard.SpecialValue = FoodValue;
		MyGameCard.SpecialIcon.sprite = SpriteManager.instance.FoodIcon;
		if ((!MyGameCard.HasParent || MyGameCard.Parent.CardData is HeavyFoundation) && MyGameCard.HasChild && !MyGameCard.TimerRunning && !(MyGameCard.Child.CardData is Hotpot) && !(MyGameCard.Child.CardData is FoodWarehouse) && (string.IsNullOrEmpty(HeldCardId) || (!string.IsNullOrEmpty(HeldCardId) && MyGameCard.Child.CardData.Id == HeldCardId)))
		{
			StoreFood();
		}
		if (!string.IsNullOrEmpty(HeldCardId))
		{
			Food food = WorldManager.instance.GameDataLoader.GetCardFromId(HeldCardId) as Food;
			nameOverride = SokLoc.Translate("card_food_warehouse_name_long", LocParam.Create("food", WorldManager.instance.GameDataLoader.GetCardFromId(HeldCardId).Name));
			descriptionOverride = SokLoc.Translate("card_food_warehouse_description_long", LocParam.Create("food", WorldManager.instance.GameDataLoader.GetCardFromId(HeldCardId).Name), LocParam.Create("amount", (FoodValue / food.FoodValue).ToString()));
		}
		else
		{
			nameOverride = SokLoc.Translate("card_food_warehouse_name");
			descriptionOverride = null;
		}
		base.UpdateCard();
		if (string.IsNullOrEmpty(HeldCardId))
		{
			Icon = SpriteManager.instance.EmptyTexture;
		}
		else
		{
			Icon = WorldManager.instance.GetCardPrefab(HeldCardId).Icon;
		}
		MyGameCard.UpdateIcon();
	}

	public void StoreFood()
	{
		foreach (GameCard childCard in MyGameCard.GetChildCards())
		{
			if (string.IsNullOrEmpty(HeldCardId))
			{
				HeldCardId = childCard.CardData.Id;
			}
			if (childCard.CardData.Id != HeldCardId || childCard.CardData is Hotpot || childCard.CardData is FoodWarehouse)
			{
				continue;
			}
			if (childCard.SpecialValue.HasValue && FoodValue + childCard.SpecialValue <= MaxFoodValue)
			{
				FoodValue += childCard.SpecialValue.GetValueOrDefault();
				childCard.DestroyCard(spawnSmoke: true);
				continue;
			}
			if (FoodValue != MaxFoodValue && childCard.CardData is Food food)
			{
				int num = MaxFoodValue - FoodValue;
				FoodValue = MaxFoodValue;
				food.FoodValue -= num;
			}
			childCard.RemoveFromParent();
			break;
		}
	}

	public GameCard RemoveFood(int count)
	{
		Food food = WorldManager.instance.GameDataLoader.GetCardFromId(HeldCardId) as Food;
		int b = FoodValue / food.FoodValue;
		count = Mathf.Min(count, b);
		GameCard gameCard;
		if (FoodValue < food.FoodValue)
		{
			gameCard = WorldManager.instance.CreateCardStack(base.transform.position + Vector3.up * 0.2f, 1, HeldCardId, checkAddToStack: false);
			WorldManager.instance.StackSend(gameCard.GetRootCard(), OutputDir);
			Food food2 = gameCard.CardData as Food;
			if (food2 != null)
			{
				food2.FoodValue = FoodValue;
			}
			FoodValue = 0;
		}
		else
		{
			gameCard = WorldManager.instance.CreateCardStack(base.transform.position + Vector3.up * 0.2f, count, HeldCardId, checkAddToStack: false);
			WorldManager.instance.StackSend(gameCard.GetRootCard(), OutputDir);
			FoodValue -= count * food.FoodValue;
		}
		return gameCard.GetRootCard();
	}

	public override void Clicked()
	{
		int count = 1;
		if (InputController.instance.GetKey(Key.LeftShift) || InputController.instance.GetKey(Key.RightShift))
		{
			count = 5;
		}
		if (FoodValue > 0)
		{
			RemoveFood(count);
		}
		if (FoodValue == 0)
		{
			HeldCardId = null;
		}
		base.Clicked();
	}
}
