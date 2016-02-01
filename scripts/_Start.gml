//_Start(state)
for(i=0;i<4;i++)
    btime[i]=0

var s;
s = argument0
    
time -= utime
utime = 0

if hasItem("note: 'D'") && hasItem("note: 'R'") && hasItem("note: 'E'") && hasItem("note: 'A'") && hasItem("note: 'M'") 
{
    if time <= 0
        time = 1
        
    s = 21
}

if time <= 0
{
    time = 60
    _Start(9)
    return 0;
}

switch s
{

case 0:
    lookedInPatsRoom = false
    patInHisRoom = true
    plantExamined = false
    noticeBoardExamined = false
    kitchenVisited = false

    time = 60
    playthrough = 1
    text = "You are sitting in your chair in front of your PC. It is 11:59. Lunch break will be at 12. That's only one minute left. You may aswell head to the cafeteria right now. To get some of the cookies which are always out very fast. Just as you are going out of the room you notice a blue piece of paper which was pinned to your door. It says: "+'"'+"Escape the loop."+'"'+'"'+"What a silly joke."+'"'+", you say to yourself."
    numberOfButtons = 1
    
    btime[0] = 4
    button[0].text = "exit to the corridor."
break;

case 9: //restart
    overlay = 110
    text = "But suddenly, within a blink of the eye, you are back in your room sitting on your chair. "
    if playthrough = 1
        text += "You can't believe what just happened. "
    if playthrough = 2
        text += '"'+"What? again?"+'"'+", you ask yourself. This is getting crazy. "
    if playthrough > 2
        text += "Again. "
    text += "According to your watch it is 11:59."
    
    playthrough++
    
    patInHisRoom = true
    
    numberOfButtons = 1
    
    btime[0] = 4
    button[0].text = "exit to the corridor."    
break

case 1: //corridor
    if playthrough = 1
        text = "You wonder if Pat, your co-worker might want to come with you. He is always pissed when you don't wait with lunch for him. Or you could just head straight to the cafeteria."
    else
        text = "You are standing in the corridor."
    
    numberOfButtons = 2
    btime[0] = 2
    btime[1] = 4
    button[0].text = "Enter Pat's room."
    button[1].text = "Head towards the cafeteria."
break;

case 2: //patricks room
    text = "Pat greets you shortly, but doesn't even look up. He seems to be lost in some important project. You ask him: "+chr(34)+"Wanna head to the cafeteria early?"+chr(34)+". He just answers: "+chr(34)+"No, thanks."+'"'+"."
    utime += 4
    
    if hasItem("soiled cookie")
        numberOfButtons = 3
    else
        numberOfButtons = 2
    
    btime[0] = 5
    btime[1] = 1
    btime[2] = 4
    
    button[0].text = "Head towards the cafeteria. "
    button[1].text = "Look around in Pat's room for a bit. "
    button[2].text = "Offer Pat your cookie. "
break

case 3: //corridor2
    text = "This time you notice the fuse box on your way to the cafeteria."
    numberOfButtons = 2
    utime+=1
    
    btime[0] = 1
    btime[1] = 1
    
    button[0].text = "head to the cafeteria" 
    button[1].text = "examine the fuse box"
    //TODO
    
break

case 4: //pat-room examination
    if !lookedInPatsRoom
    {
        text = "You look around in the room for a bit. "
        utime += 4
    }
    else
        text = ""    
    text += "There is a notice board on the wall and a potted plant."
        
    utime += 2
    
    numberOfButtons = 3
    
    btime[0] = 1
    btime[1] = 1
    btime[2] = 5
    
    button[0].text = "Examine the notice board."
    button[1].text = "Examine the plant."
    button[2].text = "Head towards the cafetera."
    
    lookedInPatsRoom = true
break

case 5: //cafeteria
    if hasItem("hot coffee")
    {
        text = "As you enter the cafeteria again, you take a look through the window at the cold outside. You have a fantastic idea: You take a small ice cone from outside and put it into your hot coffee. You drink the cooled down coffee in one big gulp. At the bottom of your coffee you surprisingly find another blue piece of paper. It has the letter 'M' written on it. "
        removeItem("hot coffee")
        addItem("note: 'M'")
        utime += 20
    }
    else
    if alt
    {
        text = "You are back in the cafeteria. "
        alt = false
    }
    else
    if playthrough = 1
        text = "You enter the cafeteria. Man, they didn't even put out the cookies, yet. What a dissapointment. "
    else
    if playthrough > 1
        text = "The cafeteria. Still no cookies. "
        
    if hasItem("cookie") || hasItem("soiled cookie")
        nuberOfButtons = 2
    else
        numberOfButtons = 3
    utime += 1
    
    btime[0] = 6
    btime[1] = 4
    btime[2] = 6
    
    button[0].text = "Go to the restroom. "
    button[1].text = "Go to the coffee machine. "
    button[2].text = "Go to the kitchen. "
    
    
    
break

case 6: //notice board pat
    text = "As you aproach the notice board Pat says: "+'"'+"Are you looking at my stuff? That's private. "+'"'+". You shouldn't do that while he is present."    
    utime += 6
    if !plantExamined
        numberOfButtons = 2
    else
        numberOfButtons = 1
        
    btime[0] = 5
    btime[1] = 1
    
    button[0].text = "Head towards the cafeteria."
    button[1].text = "Examine the plant."
    
    noticeBoardExamined = true
break

case 7: //plant
    text = "You find a small cute caterpillar on one of the leaves. You decide to keep it."
    addItem("caterpillar")
    utime += 20
    
    if !noticeBoardExamined
        numberOfButtons = 2
    else
        numberOfButtons = 1
    
    btime[0] = 5
    btime[1] = 1
        
    button[0].text = "Head towards the cafeteria."
    button[1].text = "Examine the notice board."
    
    plantExamined = true
break

case 8: //notice board free
    text = "Now that you take a closer look at the notice board, you see that there is a suspicious blue note. It shows the letter 'D'. Weird."
    addItem("note: 'D'")
    utime += 5
    
    if plantExamined
        numberOfButtons = 1
    else
        numberOfButtons = 2
    
    btime[0] = 5
    btime[1] = 1
    
    button[0].text = "Head towards the cafeteria."
    button[1].text = "Examine the plant"
break

case 10: //eat
//nothing to see here. just bad coding. unnecessaryty
break

case 11: // toilets
    text = "You enter the toilets. It stinks. Terrible. There are a few toilets, a sink and a trash can."
    if alt
    {
        text = "You are back in the restroom. "
        alt = false
    }
    utime += 2
    
    if hasItem("note: 'R'")
        numberOfButtons = 2
    else
        numberOfButtons = 3
    
    btime[0] = 6
    btime[1] = 3
    btime[2] = 2
    
    button[0].text = "Leave. "
    button[1].text = "Go to one of the toilets. "
    button[2].text = "Look in the trash can. "
break

case 12: //kitchen
    text = "You walk around in the kitchen a bit until an cafeteria employee shouts at you: "+'"'+"You are not supposed to walk around in here. Lunch will be in a few minutes."+'"'+" On your way out you manage to steal a cookie. "
    utime += 8   
    addItem("cookie")
    kitchenVisited = true
    
    btime[0] = 2
    numberOfButtons = 1
    
    button[0].text = "Leave."    
    
break

case 13: //toilet
    text = "The horrible smell comes from this soiled toilet. It is disgusting."
    utime += 4
    if hasItem("cookie")
        numberOfButtons = 2
    else
        numberOfButtons = 1
        
    btime[0] = 3
    btime[1] = 2
    button[0].text = "Leave. "
    button[1].text = "Dip the cookie in the toilet. "
break

case 14: //trash can
    text = "You take a look in the trash can. There is a blue piece of paper. It kind of looks like the other one. You decide to take it. The letter 'R' is written on it. "
    addItem("note: 'R'")
    utime += 3
    numberOfButtons = 1    
    btime[0] = 2
    
    button[0].text = "Step back from the trash can."
    
break

case 15: //dip :)
    text = "You slowly dip the cookie into the not-so-clean toilet water. "
    utime += 10
    removeItem("cookie")
    addItem("soiled cookie")
    
    numberOfButtons = 1
    btime[0] = 2
    
    button[0].text = "Go back. "
break

case 16: //fuse box
    text = "For whatever reason you decide to open the fuse box. Inside it you find another blue note. It has the letter 'E' written on it. "
    utime += 10
    addItem("note: 'E'")    
    numberOfButtons = 1
    
    button[0].text = "Head to the cafeteria. "
break

case 17: //Pat cookie bad stuff
    text = "Pat takes the cookie. "+'"'+"Thanks, man!"+'"'+", he says. He bites into the cookie and has this strange expression on his face. "+'"'+"What the fuck?"+'"'+", he screams and runs out of the room. It seems like he's running off to the toilet. Poor guy."
    utime += 15
    removeItem("soiled cookie")
    patInHisRoom = false
    noticeBoardExamined = false
    
    if plantExamined
        numberOfButtons = 2
    else
        numberOfButtons = 3
    
    button[0].text = "Leave towards the cafeteria. "
    button[1].text = "Examine the notice board. "
    button[2].text = "Examine the plant. "
break

case 18: //coffee machine
    text = "You could at least get a cup of coffee. There are also apples in a basket next to the coffee machine."
    utime += 1
    
    if hasItem("caterpillar")
        numberOfButtons = 3
    else
        numberOfButtons = 2    
        
    btime[0] = 4
    btime[1] = 2
    btime[2] = 3
    
    button[0].text = "Go back to the cafeteria. "
    button[1].text = "get a cup of coffee. "
    button[2].text = "get an apple for your caterpillar. "
    
    
break

case 19: //coffee logic
    if hasItem("hot coffee")
    {
        text = "You still have coffee. It is still hot. What are you doing here?"
        utime += 3
    }
    else
    if hasItem("note: 'M'")
    {
        text = "You don't think you want another coffee. "
        utime += 3    
    }
    else
    {
        text = "You get yourself a coffee from the machine. "+'"'+"Ouch, that's hot!"+'"'+", you scream as you take a nip. You will have to wait until it cools down."
        utime += 18
        addItem("hot coffee")
    }
    numberOfButtons = 1    
    btime[0] = 4    
    button[0].text = "Return to the cafeteria. "
break

case 20: //caterpillar magic
    text = "Your caterpillar must be very hungry. You give it an apple and it surprisingly starts to eat. It eats, and eats, and eats. It eats the whole apple and as soon as it has finished eating it turns into a big blue butterfly made out of thin blue paper. You unfold the note. It has the letter 'A' written on it. "
    utime += 20
    removeItem("caterpillar")
    addItem("note: 'A'")
    
    numberOfButtons = 1
    
    btime[0] = 4
    
    button[0].text = "Return to the cafeteria. "
    
break

case 21: //game end
    text = "Today did five things. Things you wouldn't usually do. You looked into a fuse box for no reason. You cooled your coffee with an ice cone. You took garbage out of a trash can. You made your co-worker eat shit. You saw a catterpillar eat a whole apple and transform into paper. Paper. You got five notes: 'D', 'R', 'E', 'A', 'M'. Dream. So that is the solution. Simple, isn't it?"
    numberOfButtons = 1
    button[0].text = "You wake up. "
break

default: text = "room not written, yet. Sorry :("
}


state = argument0

text = scrFormatString(text, text_width) 
if ds_list_size(items)>0
    text += "#" + scrFormatString("(Inventory: " + invString() + ")", text_width)

for(i = 0; i < 4; i++)
{
    if i < numberOfButtons
        button[i].visible = true
    else
        button[i].visible = false
}
