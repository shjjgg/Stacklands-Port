using System;

[Serializable]
public class CardRequirement_HasHousing : CardRequirement
{
	public int Amount;

	public override string RequirementDescriptionNeed(int multiplier)
	{
		string value = $"{Amount * multiplier}";
		return SokLoc.Translate("label_requirement_has_housing", LocParam.Create("amount", value));
	}

	public override string RequirementDescriptionNeedNegative(int multiplier)
	{
		string value = $"{Amount * multiplier}";
		return SokLoc.Translate("label_requirement_has_housing_negative", LocParam.Create("amount", value));
	}

	public override bool Satisfied(GameCard card)
	{
		if (card.CardData is Worker worker && (worker.Housing == null || worker.Housing.IsDamaged || !worker.Housing.HasEnergyInput()))
		{
			return false;
		}
		return true;
	}
}
