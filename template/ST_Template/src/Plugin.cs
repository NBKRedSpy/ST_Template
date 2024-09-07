using BepInEx;
using BepInEx.Configuration;
using BepInEx.Logging;
using HarmonyLib;
using RST;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace ST_Template
{

    [BepInPlugin(MyPluginInfo.PLUGIN_GUID, MyPluginInfo.PLUGIN_NAME, MyPluginInfo.PLUGIN_VERSION)]
    public class Plugin : BaseUnityPlugin
    {
        public static string ModAssemblyName => Assembly.GetExecutingAssembly().GetName().Name;

        public static ManualLogSource Log { get; set; }

        //public static Color HighlightColor { get; private set; }

        private void Awake()
        {
            Log = Logger;

            //HighlightColor = Config.Bind("Options", nameof(HighlightColor), Color.green,
            //    "Example").Value;

            Harmony harmony = new Harmony(MyPluginInfo.PLUGIN_GUID);
            harmony.PatchAll();
        }
    }
}
