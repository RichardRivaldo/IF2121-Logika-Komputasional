/* inventory.pl */

/* Definisi Inventory dengan space 100 */

:- dynamic(usedSpace/1).
inventory(X) :- usedSpace(X).

/* Definisi Is In Inventory */

:- dynamic(stored/2).
isInInvent(X) :- stored(X,Y), Y > 0.

/* Definisi Save Item */

:- dynamic(saveItem/1).
saveItem(X) :-  (inventory(Used), Used < 100 ->
                (stored(X,Y) -> retract(stored(X,Y)), Z is Y+1, 
                asserta(stored(X,Z)), retract(usedSpace(Used)), 
                NewUsed is Used + 1, asserta(usedSpace(NewUsed));
                asserta(stored(X,1)), retract(usedSpace(Used)), 
                NewUsed is Used + 1, asserta(usedSpace(NewUsed))),
                write('Item stored to inventory. Your bag is heavier now.'), nl;
                write('Your inventory space is not enough to save this item.'), nl).

/* Definisi Init Inventory */

/* Swordsman dan Knight */
initInventSK :- asserta(usedSpace(6)), asserta(eqWeapon(none)), 
                asserta(eqArmor(none)), asserta(eqAccessory(none)), 
                asserta(stored(health_potion, 5)), asserta(stored(iron_sword, 1)).

/* Archer dan Hunter */
initInventAH :- asserta(usedSpace(6)), asserta(eqWeapon(none)), 
                asserta(eqArmor(none)), asserta(eqAccessory(none)), 
                asserta(stored(health_potion, 5)), asserta(stored(slow_bow, 1)).

/* Sorcerer dan Magus */
initInventSM :- asserta(usedSpace(6)), asserta(eqWeapon(none)), 
                asserta(eqArmor(none)), asserta(eqAccessory(none)), 
                asserta(stored(health_potion, 5)), asserta(stored(neutral_wand, 1)).

/* Assassin dan Slayer */
initInventAS :- asserta(usedSpace(6)), asserta(eqWeapon(none)), 
                asserta(eqArmor(none)), asserta(eqAccessory(none)), 
                asserta(stored(health_potion, 5)), asserta(stored(dull_knife, 1)).

/* Tamer dan Summoner */
initInventTS :- asserta(usedSpace(6)), asserta(eqWeapon(none)), 
                asserta(eqArmor(none)), asserta(eqAccessory(none)), 
                asserta(stored(health_potion, 5)), asserta(stored(rockhard_leash, 1)).


/* Definisi Count Item */

countItem(Item, Count) :-  stored(Item, Count).


/* Definisi Wiki */

wiki :-         write(' __    __ _ _    _   __'), nl,
                write('/ / /\\ \\ (_) | _(_) / /  ___   __ _ '), nl,
                write('\\ \\/  \\/ / | |/ / |/ /  / _ \\ / _` |'), nl,
                write(' \\  /\\  /| |   <| / /__| (_) | (_| |'), nl,
                write('  \\/  \\/ |_|_|\\_\\_\\____/\\___/ \\__, |'), nl,
                write('                              |___/ '), nl, nl,

                write('WikiLog here, guiding our new players to survive and win the game!'), nl, nl,
                write('1. In case you have not started your journey yet, use \'start.\' to begin!'), nl,
                write('2. Reveal your identity, starting with small cased letter and end it with \'.\', else our old machine cannot read your name!'), nl,
                write('3. Choose your class wisely. We keep the secrets of each classes, so you should experiment it all if you want to know more about them!'), nl,
                write('4. Wait. One more thing about class. Try to find the key to the best class available in the game!'), nl,
                write('5. After you are registered, you will be given basic starter tools. We want you to survive and not die on the day you start!'), nl,
                write('6. You can check your stats with the command \'stats.\', never think that you are already strong!'), nl,
                write('7. These are navigations that you can take from this WikiLog to your desired curiousity: '), nl,
                write('   * Enter anything to go back to Main Menu. Basic, isn\'t it?'), nl,
                write('   * Enter 1 to know more about your spacial bag. Practical storage is an important thing, you know!'), nl,
                write('   * Enter 2 to find out more about equipments in our territory. Adapting faster is one way to survive!'), nl,
                write('   * Enter 3 to have some informations about potions, The Blessings from Gods bestowed upon us!'), nl, nl,
                write('The choice is yours. You do it: '), read_integer(WikiChoice), nl,
                (WikiChoice = 1 -> invWiki;
                WikiChoice = 2 -> eqWiki;
                WikiChoice = 3 -> potWiki;
                mainMenu).


invWiki :-      write('1. You are given a spacial bag to store your items with maximum space of 100. Only store important items in it!'), nl,
                write('2. Use the command \'bag.\' to check what you bring with you now. It is always good to be prepared~'), nl,
                write('3. We do not want you to keep useless items. Use \'throw(item_name, amount).\' to throw it away. DO IT NOW!!!'), nl.



eqWiki :-       write('1. There are three type of equipments that you can use: Weapon, Armor, and Accessory.'), nl,
                write('2. Informations are usually classified, but for you, you can check its information with these commands: '), nl,
                write('   * Weapon Informations    : \'weapon(weapon_name).\''), nl,
                write('   * Armor Informations     : \'armor(armor_name).\''), nl,
                write('   * Accessory Informations : \'accessory(accessory_name).\''), nl,
                write('3. Each items are made from different monsters\', or even gods\' blessings. Always use the strongest one that you can equip right away!'), nl,
                write('4. To ask for the effects of each weapons is very rude! Determine it yourself from your stats if you are using it!'), nl,
                write('5. To become powerful, suits yourself with your best items. To equip it, you can use the following commands: '), nl,
                write('   * Equip Weapon    : \'equipWp(weapon_name).\''), nl,
                write('   * Equip Armor     : \'equipArm(armor_name).\''), nl,
                write('   * Equip Accessory : \'equipAccs(accessory_name).\''), nl,
                write('6. If you want to unequip your equipments, use these and the item will be stored back to your bag if it still has empty spaces: '), nl,
                write('   * Unequip Weapon    : \'unequipWp(weapon_name).\''), nl,
                write('   * Unequip Armor     : \'unequipArm(armor_name).\''), nl,
                write('   * Unequip Accessory : \'unequipAccs(weapon_name).\''), nl,
                write('7. You can replace your current equipped items without having to unequip the old one first. Easy peasy, bois!'), nl, 
                write('8. There are five states of items. They give you different buffs for your stats! From lowest to highest: '), nl,
                write('   * |Ghost States|'), nl,
                write('   * |Demon States|'), nl,
                write('   * |Mamon States|'), nl,
                write('   * |Lucifer States|'), nl,
                write('   * |~&^*$%@)~(I*&T|'), nl.
                

potWiki :-      write('1. Potions are generous blessings from Gods that our best engineer refined once again, bringing the epitome of its value!'),
                write('2. Remember, these potions will help you improve yourself, or even save you from dangers!'), nl,
                write('3. Boosts from potions are permanent! Only best potions are available in our territory~'), nl,
                write('4. There are 5 types of potions, each representing their buffs. They are:'), nl,
                write('   * |Health Potions|'), nl,
                write('   * |Attack Potions|'), nl,
                write('   * |Defense Potions|'), nl,
                write('   * |Magic Potions|'), nl,
                write('   * |Speed Potions|'), nl,
                write('5. Using the command \'potion(potion_name).\', you can check informations of it. Truly awesome!'), nl,
                write('6. The only way to respect the Gods is to use the potion by drinking it all. Use \'drink(potion_name).\''), nl.

