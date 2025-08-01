using System;
using System.Collections.Generic;

public class FacialFeatures
{
    public string EyeColor { get; }
    public decimal PhiltrumWidth { get; }

    public FacialFeatures(string eyeColor, decimal philtrumWidth)
    {
        EyeColor = eyeColor;
        PhiltrumWidth = philtrumWidth;
    }

    public override bool Equals(object obj)
    {
        if (obj is FacialFeatures other)
        {
            return EyeColor == other.EyeColor
                    && PhiltrumWidth == other.PhiltrumWidth;
        }
        else
        {
            return false;
        }
    }

    public override int GetHashCode() =>
        EyeColor.GetHashCode() + PhiltrumWidth.GetHashCode() * 2;
}

public class Identity
{
    public string Email { get; }
    public FacialFeatures FacialFeatures { get; }

    public Identity(string email, FacialFeatures facialFeatures)
    {
        Email = email;
        FacialFeatures = facialFeatures;
    }

    public override bool Equals(object obj)
    {
        if (obj is Identity other)
        {
            return (other.Email == Email) &&
                    other.FacialFeatures.Equals(FacialFeatures);
        }
        return false;
    }

    public override int GetHashCode() =>
        Email.GetHashCode() * 7 - FacialFeatures.GetHashCode();
}

public class Authenticator
{
    private readonly Identity admin =
        new Identity("admin@exerc.ism", new FacialFeatures("green", 0.9m));

    public static bool AreSameFace(FacialFeatures faceA, FacialFeatures faceB) =>
        faceA.Equals(faceB);

    public bool IsAdmin(Identity identity) =>
        admin.Equals(identity);

    private HashSet<Identity> registered = new();

    public bool Register(Identity identity) =>
        registered.Add(identity);

    public bool IsRegistered(Identity identity) =>
        registered.Contains(identity);

    public static bool AreSameObject(Identity identityA, Identity identityB) =>
        ReferenceEquals(identityA, identityB);
}
