::GothicMusic <- {
	ID = "mod_gothic_music",
	Name = "Gothic Music",
	Version = "0.1.0",
	GitHubURL = "https://github.com/CyrillicPaintor/Gothic-Music",

	Global = {},
	Private = {
		VanillaMusic = {},
	}
	Music = {
		MenuTracks = [
			"music/mod_gothic_music/MenuTracks/01. Title Theme.ogg",
		],
		CreditsTracks = [
			"music/mod_gothic_music/Credits/36 credits.ogg",
		],
		Retirement1Tracks = [	// Bad Ending
			"music/mod_gothic_music/Credits/13 monastery chapel.ogg",
		],
		Retirement2Tracks = [	// Average Ending
			"music/mod_gothic_music/Credits/36 credits.ogg",
		],
		Retirement3Tracks = [	// Good Ending
			"music/mod_gothic_music/Retirement/35 retire.ogg",
		],
		Retirement4Tracks = [	// Best ending
			"music/mod_gothic_music/Retirement/35 retire.ogg",
		],
		IntroTracks = [
			"music/mod_gothic_music/Intro/00 installation.ogg",
		],
		SouthernIntroTracks = [
			"music/mod_gothic_music/Intro/00 installation.ogg",
		],
		WorldmapTracks = [
			"music/mod_gothic_music/WorldmapTracks/05 - Exploring Myrtana.ogg",
			"music/mod_gothic_music/WorldmapTracks/07 - Ominous Woods.ogg",
			"music/mod_gothic_music/WorldmapTracks/07 new isle world.ogg",
			"music/mod_gothic_music/WorldmapTracks/11 - Vista Point.ogg",
			"music/mod_gothic_music/WorldmapTracks/16 - The Castle Of Faring.ogg",
			"music/mod_gothic_music/WorldmapTracks/25 old mine valley.ogg",
		],
		WorldmapTracksGreaterEvil = [
			"music/mod_gothic_music/WorldmapTracks/05 - Exploring Myrtana.ogg",
			"music/mod_gothic_music/WorldmapTracks/07 - Ominous Woods.ogg",
			"music/mod_gothic_music/WorldmapTracks/07 new isle world.ogg",
			"music/mod_gothic_music/WorldmapTracks/11 - Vista Point.ogg",
			"music/mod_gothic_music/WorldmapTracks/16 - The Castle Of Faring.ogg",
			"music/mod_gothic_music/WorldmapTracks/25 old mine valley.ogg",
		],
		WorldmapTracksSouth = [
			"music/mod_gothic_music/WorldmapTrackSouth/06 - Myrtanian Nights.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/08 - Ominous Nights.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/10 - Castle Nights.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/12 monastery.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/40 - Desert Moon.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/39 - Desert Sun.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/42 - Death Valley.ogg",
		],
		WorldmapTracksGreaterEvilSouth = [
			"music/mod_gothic_music/WorldmapTrackSouth/06 - Myrtanian Nights.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/08 - Ominous Nights.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/10 - Castle Nights.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/12 monastery.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/40 - Desert Moon.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/39 - Desert Sun.ogg",
			"music/mod_gothic_music/WorldmapTrackSouth/42 - Death Valley.ogg",
		],
		VillageTracks = [
			"music/mod_gothic_music/Village/04 lobard farm.ogg",
			"music/mod_gothic_music/Village/12. Free Mine.ogg",
			"music/mod_gothic_music/Village/16 - The Castle Of Faring.ogg",
		],
		CityTracks = [	// Civilian settlements size 2+
			"music/mod_gothic_music/City/04. Old Camp.ogg",
			"music/mod_gothic_music/City/05 city of Khorinikvalita.ogg",
			"music/mod_gothic_music/City/09. New Camp.ogg",
		],
		StrongholdTracks = [
			"music/mod_gothic_music/Stronghold/09 - A King's City.ogg",
		],
		CityStateTracks = [
			"music/mod_gothic_music/CityState/21 pyramid valley.ogg",
			"music/mod_gothic_music/CityState/38 - Welcome To Varant.ogg",
			"music/mod_gothic_music/CityState/46 - Ishtar.ogg",
		],
		VictoryTracks = [
			// Perhaps we just dont replace this. Its too iconic and too often played
			"music/victory_01.ogg",
		],
		DefeatTracks = [
			"music/mod_gothic_music/Defeat/17 - Sad Strings.ogg",
			"music/mod_gothic_music/Defeat/32 - Death.ogg",
		],
		CampfireTracks = [
			"music/mod_gothic_music/Credits/36 credits.ogg"
		],
	},		// Structured Music in the same way that vanilla does it
}

::GothicMusic.HooksMod <- ::Hooks.register(::GothicMusic.ID, ::GothicMusic.Version, ::GothicMusic.Name);
::GothicMusic.HooksMod.require(["mod_msu"]);

::GothicMusic.HooksMod.queue(">mod_msu", function() {
	::GothicMusic.Mod <- ::MSU.Class.Mod(::GothicMusic.ID, ::GothicMusic.Version, ::GothicMusic.Name);

	::GothicMusic.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, ::GothicMusic.GitHubURL);
	::GothicMusic.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

	::include("mod_gothic_music/load");		// Load GothicMusic-Adjustments and other hooks
});

::GothicMusic.HooksMod.queue([], function() {
	::GothicMusic.Private.VanillaMusic = ::MSU.deepClone(::Const.Music);
	::GothicMusic.Global.updateMusicMix();
}, ::Hooks.QueueBucket.Late);

::GothicMusic.Global.updateMusicMix <- function()
{
	// ::logWarning("GothicMusic: updateMusicMix " + ::GothicMusic.Mod.ModSettings.getSetting("MusicMixType").getValue());
	switch (::GothicMusic.Mod.ModSettings.getSetting("MusicMixType").getValue())
	{
		case "Custom Only":
		{
			::GothicMusic.Private.applyCustomMusic();
			break;
		}
		case "Combined":
		{
			::GothicMusic.Private.applyMixedMusic();
			break;
		}
		case "Vanilla Only":
		{
			::GothicMusic.Private.restoreVanillaMusic();
			break;
		}
	}
}

::GothicMusic.Private.restoreVanillaMusic <- function()
{
	::Const.Music = ::MSU.deepClone(::GothicMusic.Private.VanillaMusic);
}

::GothicMusic.Private.applyCustomMusic <- function()
{
	local customMusic = ::MSU.deepClone(::GothicMusic.Private.VanillaMusic);
	foreach (key, entry in ::GothicMusic.Music)
	{
		// Replace all vanilla entries, if custom one exists for them
		customMusic[key] = ::MSU.deepClone(entry);
	}
	::Const.Music = customMusic;
}

::GothicMusic.Private.applyMixedMusic <- function()
{
	local mixedMusic = ::MSU.deepClone(::GothicMusic.Private.VanillaMusic);
	foreach (key, entry in ::GothicMusic.Music)
	{
		mixedMusic[key].extend(entry);
	}
	::Const.Music = mixedMusic;
}
