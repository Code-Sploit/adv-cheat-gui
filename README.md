# adv-cheat-gui
Repository for a Advanced Interactive GUI to interact with DragonFire (a minetest hackclient)'s cheats.

## warning:
### This does require a little client modification:
    File: src/defaultsettings.cpp
    Change: add: settings->setDefault("fastplace_interval","0.0001")
    
    File: src/client/game.cpp
    Change: change: (runData.repeat_place_timer >= (g_settings->getBool("fastplace") ? 0.0001 : m_repeat_place_time))) &&
            to:     (runData.repeat_place_timer >= (g_settings->getBool("fastplace") ? g_settings->getFloat("fastplace_interval") : m_repeat_place_time))) &&

# Supports
    1) Basic DF cheats
    2) Settings for ESP, Tracers, Reach and FastPlace

# Todo:
    1) Make it more stable
    2) Add a function to register cheats
    3) Add a function to register settings

# Thanks to:
    @cora For helping me out in some situations
