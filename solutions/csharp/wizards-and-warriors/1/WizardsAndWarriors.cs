using System;

abstract class Character
{
    private string characterType;
    protected Character(string characterType)
    {
        this.characterType = characterType;
    }

    public abstract int DamagePoints(Character target);

    public virtual bool Vulnerable()
    {
        return false;
    }

    public override string ToString()
    {
        return $"Character is a {characterType}";
    }
}

class Warrior : Character
{
    public Warrior() : base("Warrior")
    {
    }

    public override int DamagePoints(Character target)
    {
        return target.Vulnerable() ? 10 : 6;
    }
}

class Wizard : Character
{
    bool preparedSpell;
    public Wizard() : base("Wizard")
    {
        this.preparedSpell = false;
    }

    public override int DamagePoints(Character target)
    {
        return preparedSpell ? 12 : 3;
    }

    public override bool Vulnerable()
    {
        return !preparedSpell;
    }

    public void PrepareSpell()
    {
        preparedSpell = true;
    }
}
