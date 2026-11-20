using UnityEngine;
using UnityEngine.InputSystem;

public class ResourceChest : CardData
{
	[ExtraData("resource_count")]
	[HideInInspector]
	public int ResourceCount;

	[ExtraData("resource_id")]
	[HideInInspector]
	public string HeldCardId = "";

	public Sprite SpecialIcon;

	[Term]
	public string ChestTermOverride = "card_storage_container_name_override";

	[Term]
	public string ChestDescriptionLong = "card_storage_container_description_long";

	public int MaxResourceCount = 100;

	protected override bool CanHaveCard(CardData otherCard)
	{
		if (!string.IsNullOrEmpty(HeldCardId) && otherCard.Id != HeldCardId)
		{
			return false;
		}
		if (otherCard is Food { FoodValue: <=0 } && WorldManager.instance.CurrentBoard.Id == "cities")
		{
			return true;
		}
		if (otherCard.MyCardType != CardType.Resources || otherCard.Id == "gold" || otherCard.Id == "shell")
		{
			return false;
		}
		if (WorldManager.instance.CurrentBoard.Id == "cities" && (otherCard.Id == "poop" || otherCard.Id == "quantum_entangled_uranium"))
		{
			return false;
		}
		if (otherCard is Dollar)
		{
			return false;
		}
		return true;
	}

	public override void UpdateCard()
	{
		MyGameCard.SpecialValue = ResourceCount;
		MyGameCard.SpecialIcon.sprite = SpecialIcon;
		if (!MyGameCard.HasParent || MyGameCard.Parent.CardData is HeavyFoundation)
		{
			foreach (GameCard childCard in MyGameCard.GetChildCards())
			{
				if (string.IsNullOrEmpty(HeldCardId))
				{
					HeldCardId = childCard.CardData.Id;
				}
				if (!(childCard.CardData.Id != HeldCardId))
				{
					if (ResourceCount >= MaxResourceCount)
					{
						childCard.RemoveFromParent();
						break;
					}
					childCard.DestroyCard(spawnSmoke: true);
					ResourceCount++;
					if (ResourceCount == MaxResourceCount)
					{
						QuestManager.instance.SpecialActionComplete("full_chest");
					}
				}
			}
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

	public override void UpdateCardText()
	{
		if (!string.IsNullOrEmpty(HeldCardId))
		{
			CardData cardFromId = WorldManager.instance.GameDataLoader.GetCardFromId(HeldCardId);
			nameOverride = SokLoc.Translate(ChestTermOverride, LocParam.Create("resource", cardFromId.Name));
			if (MyGameCard.IsHovered)
			{
				descriptionOverride = SokLoc.Translate(ChestDescriptionLong, LocParam.Create("resource", cardFromId.Name), LocParam.Create("amount", ResourceCount.ToString()));
			}
		}
		else
		{
			nameOverride = null;
			descriptionOverride = null;
		}
	}

	public GameCard RemoveResources(int count)
	{
		count = Mathf.Min(count, ResourceCount);
		GameCard gameCard = WorldManager.instance.CreateCardStack(base.transform.position + Vector3.up * 0.2f, count, HeldCardId, checkAddToStack: false);
		WorldManager.instance.StackSend(gameCard.GetRootCard(), Vector3.right);
		ResourceCount -= count;
		return gameCard.GetRootCard();
	}

	public override void Clicked()
	{
		if (!IsDamaged)
		{
			int count = 1;
			if (InputController.instance.GetKey(Key.LeftShift) || InputController.instance.GetKey(Key.RightShift))
			{
				count = 5;
			}
			if (ResourceCount > 0)
			{
				RemoveResources(count);
			}
			if (ResourceCount == 0)
			{
				HeldCardId = null;
			}
			base.Clicked();
		}
	}
}
