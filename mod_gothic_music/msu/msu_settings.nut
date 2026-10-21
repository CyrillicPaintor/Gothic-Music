// General
{
	local generalPage = ::GothicMusic.Mod.ModSettings.addPage("General");

	local musicMixCallback = function( _oldValue )
	{
		::GothicMusic.Global.updateMusicMix();
	}
	generalPage.addEnumSetting("MusicMixType", "Custom Only", ["Custom Only", "Combined", "Vanilla Only"], "Music used:", "\"Custom Only\" will play exclusively custom music for any music category, for which this mod provides custom music. Any other category will use vanilla musci.\n\n\"Combined\" will mix this mods music with the vanilla music for every category, increasing variety and preserving all vanilla music.\n\n\"Vanilla Only\" will deactivate this mod for this playsession and return to only playing vanilla music.").addAfterChangeCallback(musicMixCallback);
}
