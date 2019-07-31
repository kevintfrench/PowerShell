# *************************************************************************
#
# Script Name: ThreeAmigos.ps1 (The Story of the Three Amigos)
# Version:     4.0
# Author:      Jerry Lee Ford, Jr.
# Date:        January 5, 2014
# 
# Description: This PowerShell script is a mad-lib styled game that tells
#              a humorous story using input provided by the player.
#
# *************************************************************************


#Clear the PowerShell Console Window
Clear-Host

#Define the variables used in this script to collect player inputs
$animal = ""   #Stores the name of an animal supplied by the player
$vehicle = ""  #Stores the name of an vehicle supplied by the player
$store = ""    #Stores the name of an store supplied by the player
$dessert = ""  #Stores the name of an dessert supplied by the player

#Display the game's opening screen
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host "                           T H E   S T O R Y"
Write-Host
Write-Host
Write-Host
Write-Host "                 O F   T H E   T H R E E   A M I G O S"
Write-Host
Write-Host
Write-Host   
Write-Host "                         By Jerry Lee Ford, Jr."
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue."

#Pause script execution and wait for the player to press the Enter key
Read-Host

#Clear the PowerShell Console Window
Clear-Host  

#Provide the player with instructions
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " This is an interactive mad-lib styled story. Before it can be"
Write-Host 
Write-Host " told, you must answer a few questions."
Write-Host
Write-Host   
Write-Host 
Write-Host 
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue."

#Pause script execution and wait for the player to press the Enter key
Read-Host

#Ask the player the first question
while ($animal -eq ""){

   Clear-Host  #Clear the PowerShell Console Window

   Write-Host
   Write-Host
   Write-Host
   Write-Host
   Write-Host
   Write-Host

   $animal = read-host " Enter the name of a scary animal "

}

#Ask the player the second question
while ($vehicle -eq ""){

   Clear-Host  #Clear the PowerShell Console Window

   Write-Host
   Write-Host
   Write-Host
   Write-Host
   Write-Host
   Write-Host

   $vehicle = read-host " Enter the name of a transportation vehicle "

}

#Ask the player the third question
while ($store -eq ""){

   Clear-Host  #Clear the PowerShell Console Window

   Write-Host
   Write-Host
   Write-Host
   Write-Host
   Write-Host
   Write-Host

   $store = read-host " Enter the name of your favorite store "

}

#Ask the player the fourth question
while ($dessert -eq ""){

   Clear-Host  #Clear the PowerShell Console Window

   Write-Host
   Write-Host
   Write-Host
   Write-Host
   Write-Host
   Write-Host

   $dessert = read-host " Enter the name of your favorite dessert "

}

#Clear the PowerShell Console Window
Clear-Host  

#Provide the player with instructions
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Once upon a time there were three very special children"
Write-Host " named Alexander, William, and Molly. Alexander was the oldest"
Write-Host " and was known to be brave and strong. Molly, the youngest,"
Write-Host " was just five years old, yet she possessed an extraordinary"
Write-Host " sense of awareness that even the wisest sage would"
Write-Host " admire and respect. William, the middle child, was both brave"
Write-Host " and wise many times beyond his years. They lived together at"
Write-Host " the top of a hill, just outside the outskirts of town, where"
Write-Host " they faithfully watched over the townsfolk. Always together"
Write-Host " and always looking out for each other and the people in the"
Write-Host " town, they were known by everyone as The Three Amigos."
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue."

#Pause script execution and wait for the player to press the Enter key
Read-Host

#Clear the PowerShell Console Window
Clear-Host

#Provide the player with instructions
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host 
Write-Host " One day, which started out no different than any other day, a"
Write-Host " great roar was heard from the center of the town. Women and"
Write-Host " small children could be seen screaming and running in panic."
Write-Host " The Three Amigos climbed to the top of their watch tower and"
Write-Host " began scanning the town streets for the source of the noise"
Write-Host " and panic. Alexander was the first to find the problem,"
Write-Host " spotting a gigantic $animal moving quickly towards the"
Write-Host " mayor's office. Just ahead of the $animal stood the town’s"
Write-Host " men, attempting to make a desperate stand." 
Write-Host " `"Hurry, we must go!`" shouted Molly. `"The town needs The"
Write-Host " Three Amigos!`" In an instant Alexander, William, and Molly"
Write-Host " jumped into an old $vehicle, scarred and worn by years"
Write-Host " of faithful service, and hurriedly raced into town."
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue."

#Pause script execution and wait for the player to press the Enter key
Read-Host

#Clear the PowerShell Console Window
Clear-Host  

#Provide the player with instructions
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Within minutes The Three Amigos found themselves standing in"
Write-Host " the center of Main street. The town was quiet and seemed"
Write-Host " almost deserted except for the old $store, where the citizens"
Write-Host " had retreated once their last stand had failed. The $animal"
Write-Host " was standing in front of the $store, preparing to"
Write-Host " break in and kill the good citizens of the town."
Write-Host " `"What do we do?`" said Alexander. William looked around and"
Write-Host " saw a pile of $dessert stacked up against the town"
Write-Host " barbershop’s storefront. `"Follow me!`" yelled William,"
Write-Host " heading straight for the pile of $dessert. Alexander"
Write-Host " and Molly instantly knew what to do, each grabbing a $dessert"
Write-Host " and hurling pieces of $dessert at the $animal. Unable to"
Write-Host " deal with the power of the attack launched by The Three"
Write-Host " Amigos, the $animal fled the town, never to be seen or heard"
Write-Host " of again."
Write-Host
Write-Host
Write-Host " Press Enter to continue."

#Pause script execution and wait for the player to press the Enter key
Read-Host

#Clear the PowerShell Console Window
Clear-Host  

#Provide the player with instructions
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host 
Write-Host " The townsfolk ran out of the $store and began cheering for"
Write-Host " their heroes. Once again The Three Amigos had saved the day." 
Write-Host 
Write-Host 
Write-Host
Write-Host
Write-Host  
Write-Host 
Write-Host
Write-Host
Write-Host  "                        T H E   E N D"
Write-Host
Write-Host 
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue."

#Pause script execution and wait for the player to press the Enter key
Read-Host

#Clear the PowerShell Console Window
Clear-Host  
