using System;

public static class BuildConstants
{
	public enum ReleaseType
	{
		None,
		itch_io,
		Steam
	}

	public enum Platform
	{
		None,
		PC,
		macOS
	}

	public enum Architecture
	{
		None,
		Windows_x64,
		macOS
	}

	public enum Distribution
	{
		None
	}

	public static readonly DateTime buildDate = new DateTime(638660598213757890L);

	public const string version = "1.5.0.21";

	public const ReleaseType releaseType = ReleaseType.Steam;

	public const Platform platform = Platform.PC;

	public const Architecture architecture = Architecture.Windows_x64;

	public const Distribution distribution = Distribution.None;
}
