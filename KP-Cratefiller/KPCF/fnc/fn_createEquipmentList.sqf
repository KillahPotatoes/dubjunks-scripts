/*
    Killah Potatoes Cratefiller

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Changes the shown equipment category.

    Parameter(s):
    NONE

    Returns:
    NONE
*/

// Dialog controls
private _dialog = findDisplay 758067;
private _ctrlCat = _dialog displayCtrl 75810;
private _ctrlWeapon = _dialog displayCtrl 75811;
private _ctrlEquipment = _dialog displayCtrl 75812;

// Clear the lists
lbClear _ctrlWeapon;
lbClear _ctrlEquipment;

// Reset variables
KPCF_activeCategory = [];

// Hide controls
_ctrlWeapon ctrlShow false;

// Read controls
private _catIndex = lbCurSel _ctrlCat;

// Check for empty selection
if (_catIndex == -1) exitWith {
    hint localize "STR_KPCF_HINTSELECTION";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
};

private _index = 0;

switch (_catIndex) do {

    // Weapons
    case 0 : {
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
        } forEach KPCF_sortedWeapons;
    };

    // Magazines
    case 1 : {
        _ctrlWeapon ctrlShow true;
        {
            _index = _ctrlWeapon lbAdd (_x select 0);
            _ctrlWeapon lbSetData [_index , _x select 1];
        } forEach KPCF_sortedWeapons;
    };

    // Grenades
    case 2 : {
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
        } forEach KPCF_sortedGrenades;
    };

    // Explosives
    case 3 : {
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
        } forEach KPCF_sortedExplosives;
    };

    // Items
    case 4 : {
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
        } forEach KPCF_sortedItems;
    };

};
