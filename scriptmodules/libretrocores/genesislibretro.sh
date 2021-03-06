rp_module_id="genesislibretro"
rp_module_desc="GameGear/MasterSystem/Genesis LibretroCore genesis-plus-gx"
rp_module_menus="2+"

function sources_genesislibretro() {
    gitPullOrClone "$md_build" git://github.com/libretro/Genesis-Plus-GX.git
}

function build_genesislibretro() {
    make -f Makefile.libretro clean
    make -f Makefile.libretro
    md_ret_require="$md_build/genesis_plus_gx_libretro.so"
}

function install_genesislibretro() {
    md_ret_files=(
        'genesis_plus_gx_libretro.so'
        'HISTORY.txt'
        'LICENSE.txt'
        'README.md'
    )
}

function configure_genesislibretro() {
    mkRomDir "gamegear"
    mkRomDir "mastersystem-genesis"
    mkRomDir "megadrive-genesis"
    
    ensureSystemretroconfig "gamegear"
    ensureSystemretroconfig "mastersystem-genesis"
    ensureSystemretroconfig "megadrive-genesis"
    
    # system-specific shaders, gamegear
    iniConfig " = " "" "$configdir/gamegear/retroarch.cfg"

    # system-specific shaders, mastersystem
    iniConfig " = " "" "$configdir/mastersystem-genesis/retroarch.cfg"
    
    # system-specific shaders, megadrive
    iniConfig " = " "" "$configdir/megadrive-genesis/retroarch.cfg"
    
    setESSystem "Sega Master System / Mark III" "mastersystem-genesis" "~/RetroPie/roms/mastersystem-genesis" ".sms .SMS .zip .ZIP" "$rootdir/supplementary/runcommand/runcommand.sh 1 \"$emudir/retroarch/bin/retroarch -L $md_inst/genesis_plus_gx_libretro.so --config $configdir/mastersystem-genesis/retroarch.cfg %ROM%\" \"$md_id\"" "mastersystem" "mastersystem"
    setESSystem "Sega Game Gear" "gamegear" "~/RetroPie/roms/gamegear" ".gg .GG .zip .ZIP" "$rootdir/supplementary/runcommand/runcommand.sh 1 \"$emudir/retroarch/bin/retroarch -L $md_inst/genesis_plus_gx_libretro.so --config $configdir/gamegear/retroarch.cfg  %ROM%\" \"$md_id\"" "gamegear" "gamegear"
    setESSystem "Sega Mega Drive / Genesis" "megadrive-genesis" "~/RetroPie/roms/megadrive-genesis" ".smd .SMD .bin .BIN .gen .GEN .md .MD .zip .ZIP" "$rootdir/supplementary/runcommand/runcommand.sh 4 \"$emudir/retroarch/bin/retroarch -L $md_inst/genesis_plus_gx_libretro.so --config $configdir/megadrive-genesis/retroarch.cfg %ROM%\" \"$md_id\"" "genesis,megadrive" "megadrive"
}
