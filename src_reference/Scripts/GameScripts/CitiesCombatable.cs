using UnityEngine;

public class CitiesCombatable : Combatable, HousingConsumer
{
	public int HousingSpaceRequired = 1;

	[HideInInspector]
	[ExtraData("housingUniqueId")]
	public string HousingUniqueId;

	[HideInInspector]
	public Apartment Housing
	{
		get
		{
			if (HousingUniqueId != null && WorldManager.instance.GetCardWithUniqueId(HousingUniqueId) != null)
			{
				return WorldManager.instance.GetCardWithUniqueId(HousingUniqueId).CardData as Apartment;
			}
			return null;
		}
		set
		{
			HousingUniqueId = ((value != null) ? value.UniqueId : "");
		}
	}

	public string HousingId => HousingUniqueId;

	protected override bool CanHaveCard(CardData otherCard)
	{
		if (otherCard is CitiesCombatable)
		{
			return true;
		}
		return base.CanHaveCard(otherCard);
	}

	public override void OnInitialCreate()
	{
		Housing = null;
		base.OnInitialCreate();
	}

	public override void UpdateCard()
	{
		if (HousingSpaceRequired > 0 && (Housing == null || Housing.IsDamaged) && !HasStatusEffectOfType<StatusEffect_Homeless>())
		{
			AddStatusEffect(new StatusEffect_Homeless());
		}
		else if (HousingSpaceRequired <= 0 || (Housing != null && !Housing.IsDamaged && HasStatusEffectOfType<StatusEffect_Homeless>()))
		{
			RemoveStatusEffect<StatusEffect_Homeless>();
		}
		base.UpdateCard();
	}

	public override void UpdateCardText()
	{
		if (!string.IsNullOrEmpty(CustomName))
		{
			nameOverride = CustomName;
		}
	}

	public GameCard GetGameCard()
	{
		return MyGameCard;
	}

	public int GetHousingSpaceRequired()
	{
		return HousingSpaceRequired;
	}

	public WorkerType GetWorkerType()
	{
		if (Id == "robot_soldier")
		{
			return WorkerType.Robot;
		}
		return WorkerType.Normal;
	}

	public override void OnSellCard()
	{
		if (Housing != null)
		{
			Housing.UsedSpace -= GetHousingSpaceRequired();
			Housing = null;
		}
		base.OnSellCard();
	}

	public override void OnDestroyCard()
	{
		if (Housing != null)
		{
			Housing.UsedSpace -= GetHousingSpaceRequired();
			Housing = null;
		}
		base.OnDestroyCard();
	}
}
