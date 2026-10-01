-- stories.lua · the OrcTok story pool
--
-- To add a story, copy any entry below and edit it. To remove one, delete the
-- entry. Nothing else needs to change: the shuffle bag keys stories by title,
-- so titles must be unique.
--
--   title    (required) read aloud first, shown on the post card
--   body     (required) the story; blank lines split paragraphs
--   sub      subreddit shown on the card, without "r/"      (default "wow")
--   user     poster, without "u/"                          (default random)
--   ups      upvote count                                  (default random)
--   comments comment count                                 (default random)
--   age      post age, e.g. "7h"                           (default random)
--   search   text in the "Find related…" bar                (default generic)
--
-- Keep bodies to roughly 120-300 words: about one to two minutes of speech.
local _, ns = ...

ns.Stories = {
	{
		sub = "AmItheAzerothian", user = "BeastMastery4Life", ups = 48213, comments = 6120, age = "9h",
		search = "can hunters roll need on everything",
		title = "AITA for rolling Need on the Thunderfury binding as a hunter?",
		body = [[
So this happened last night and my guild is split, so I need an outside opinion.

We were in Molten Core. Garr drops the left binding of the Windseeker. Everybody knows that's the legendary sword thing. Our main tank has been waiting for it for eleven months.

The master looter set it to free for all roll because he was eating soup and forgot. I rolled Need. I rolled a 98. The tank rolled a 97.

Now, before you judge me. I am a hunter. Hunters can use swords. It's literally on the list. Also my pet, Mr. Whiskers, is a cat, and cats have claws, and claws are basically swords. So I needed it twice.

The tank started typing in all caps. The raid leader said "that is not how any of this works." My girlfriend, who is the priest, said nothing, which honestly hurt more.

I offered to give the binding back if the tank paid me five hundred gold. He said that is literally extortion. I said no, it's the free market.

Now I've been kicked from the guild and the tank has changed his name to "HunterLootRuined." My friends say I'm the villain. My pet says nothing because he's a cat.

AITA?]],
	},
	{
		sub = "BestofRedditorUpdates", user = "BeastMastery4Life", ups = 61877, comments = 9004, age = "2d",
		search = "thunderfury hunter update",
		title = "UPDATE: AITA for rolling Need on the Thunderfury binding as a hunter?",
		body = [[
A lot of you asked for an update. It's worse.

After I got kicked, I joined our rival guild, Tacos and Tanks. They welcomed me. They said anyone who could make our old tank cry is a friend of theirs.

Then we killed Garr. The second binding dropped. I rolled Need. I rolled a 100. Nobody else even rolled because they were scared of me.

So now I have both bindings. I went to Silithus to finish the quest. It needs one hundred and twenty bars of elementium, which I don't have, and I don't know how to get, and nobody will help me because I am apparently "radioactive."

The worst part: my ex guild's tank sent me a letter in game. It said "congratulations. enjoy carrying those forever." It had one copper attached.

He was right. They're still in my bags. I look at them sometimes.

Edit: Mr. Whiskers ran away. Pet happiness was too low. I understand now.]],
	},
	{
		sub = "nosleep", user = "NightShiftTramGnome", ups = 88104, comments = 4312, age = "1d",
		search = "deeprun tram rules night shift",
		title = "I work the night shift on the Deeprun Tram. There are rules.",
		body = [[
I took this job because the pay was good and I'm a gnome, so I fit in the maintenance hatch. On my first night, my supervisor handed me a card. He said "follow these, and you'll be fine."

Rule one. Never count the rats. If you count the rats, the number will always be one more than it was.

Rule two. If a passenger asks what time it is, the answer is always "tram o'clock." Do not look at your watch. Your watch will not show a time you like.

Rule three. The tram has three cars. If you see a fourth car, do not board it. Do not wave at the people inside it. They will wave back, and one of them will be you.

Rule four. If you hear knocking on the glass, it is a fish. It is always a fish. Say out loud, "that's a fish," and keep working.

Rule five. The tram never stops between Ironforge and Stormwind. If it stops, stay very still and pretend you are a lamp.

Last night the tram stopped. I stood very still. Something walked past me, slowly, and whispered "nice lamp."

I am still a lamp. I am typing this from the lamp. Please send a new night shift gnome.]],
	},
	{
		sub = "antiwork", user = "WorkWorkNoMore", ups = 132550, comments = 11231, age = "5h",
		search = "peon union how to join",
		title = "My boss says \"work work\" is not a complete sentence",
		body = [[
I'm a peon. I've been a peon for my whole life. My job is gold mine, tree, gold mine, tree. When the chieftain clicks me, I say "work work" or "zug zug." Those are my two phrases. I was trained for this.

Last week the new manager, a very tall orc named Grommash something, pulled me aside. He said my communication skills were "not leadership material." He said "work work" is not a complete sentence.

I said "me not that kind of orc." He wrote that down.

Here's the thing. I carry ten gold per trip. Ten. Do you know how much the chieftain spends on one grunt? Enough gold for me to retire. I have done over forty thousand trips. I have not had a day off since the Dark Portal opened.

Also, when he clicks on me too many times, I'm supposed to say "stop poking me." That's in my contract. It was put there as a joke. It is not a joke to me.

So today I organized the other peons. We put down our picks. We walked out of the mine together. The chieftain clicked on us forty times. We all said the same thing.

"Me busy. Leave me alone."

We have a union now. Solidarity forever. Zug zug.]],
	},
	{
		sub = "MaliciousCompliance", user = "HolyLightOnlyTank", ups = 77421, comments = 3808, age = "14h",
		search = "raid leader told healer only heal tank",
		title = "Raid leader told me to \"only heal the tank.\" So I did.",
		body = [[
I'm a paladin healer. We were in Molten Core. Our raid leader is the kind of guy who says "trust me, I've watched a video."

On the first pull he yells in voice chat, "Paladin! You are on tank healing. Only the tank. Do not waste mana on anybody else. I don't care if your mother is in this raid."

My mother is not in this raid. But my cousin is.

So on Baron Geddon, the raid leader becomes the living bomb. He runs into the middle of the raid, because of course he does. Everybody takes huge damage. The other healers are panicking. I am calmly healing the tank. The tank is at full health. He's barely even being hit.

The raid leader dies. My cousin dies. Twenty two people die. The tank and I are the only ones alive, standing there, looking at each other.

The tank says "should we... fight him?"

I said "I'm only allowed to heal you."

We fought Baron Geddon for eleven minutes. Two people. He enraged. We died.

The raid leader said "why didn't you heal me?" I read his exact words back to him. From the logs.

He now says "heal the tank, and also everyone, please, please."]],
	},
	{
		sub = "relationship_advice", user = "SwiftBrownRamWife", ups = 23110, comments = 5402, age = "3h",
		search = "husband bought epic mount instead of ring",
		title = "My (27F) husband (29M) spent our wedding savings on an epic mount",
		body = [[
We've been saving for a year. The plan was simple. One thousand gold for a nice wedding at the Stormwind Cathedral. Flowers, a bard, maybe a cake from the Goldshire inn, even though everybody says not to eat anything from Goldshire.

Yesterday I logged in and the guild bank was empty. My husband was sitting on a Swift Brown Ram. It was shiny. It went fast. He rode it around me in circles while I asked where the money was.

He said, and I quote, "baby, think about it. Now I can get to the wedding sixty percent faster."

I asked him how we are going to pay for the wedding now. He said we could have it in Ironforge because "there's free lava." He then invited me to ride on the back of the ram. The ram only has one seat. He knew that.

My friends say I should leave him. My mom says he's "a keeper, at least he has transportation." His dwarf family already sent me a card that says "welcome to the clan, lass."

Update: we had the wedding in Ironforge. The ram was the ring bearer. It was actually beautiful. I'm still mad.]],
	},
	{
		sub = "confession", user = "NotLeeroyTheOtherGuy", ups = 205331, comments = 17744, age = "2d",
		search = "who really pulled the whelps",
		title = "I've kept this secret for twenty years. I pulled the whelps. Not him.",
		body = [[
Everybody knows the story. A guy runs into the room shouting his own name, and the whole group dies to dragon whelps. There's a video. It's famous. People still shout his name in raids.

What nobody knows is that the room was already pulled.

I was the rogue. I was in stealth, trying to sneak ahead to check the eggs. I wanted to look useful. I stepped on one egg. Just one. It went "crack."

The whelps came out quietly. Nobody saw them yet. I panicked and vanished. The whelps started walking toward the group, very slowly, looking for someone to blame.

Then he came back from the kitchen. He saw the group doing math. He saw the whelps. And he made a choice. He ran in, shouting his name, so that everybody would look at him and not at me.

He never told anyone. He took the fall. For twenty years he's been known as the guy who ruined the plan. And he let it happen, because I was fifteen and I would have quit the game.

I'm thirty five now. I have a family. I've been playing a rogue this whole time, and I still vanish every time I feel guilty.

At least I have chicken.]],
	},
	{
		sub = "tifu", user = "AFK5Mins2006", ups = 94412, comments = 3301, age = "6h",
		search = "how long is afk five minutes",
		title = "TIFU by telling my guild I'd be \"AFK five minutes\" in 2006",
		body = [[
So this actually happened, and honestly it's still happening.

In 2006, my guild was in the middle of Blackrock Spire. We were about to pull a boss. My mom called me for dinner. I typed "afk 5 min" and left.

Dinner was fine. Then I went to college. Then I got a job. Then I got married. Then I had two kids. I did not think about the game once.

Last week my son asked me what World of Warcraft was. So I made a new account, logged in to my old character, and loaded into Blackrock Spire.

My guild was still there. All four of them. Standing in the exact same spot. The last message in chat was from our warrior. It said "ok he'll be back soon."

The timestamp on that message was yesterday.

I typed "back." Nobody moved for a second. Then the priest typed "finally. ok pull."

We pulled. We wiped instantly because the game had changed and none of us knew our abilities anymore. The warrior said "worth the wait."

I'm raiding with them every Tuesday now. My wife says I have to be back in five minutes. I said "sure."]],
	},
	{
		sub = "choosingbeggars", user = "PortalsNotFree", ups = 38776, comments = 2881, age = "11h",
		search = "mage portal price is it a scam",
		title = "Level 12 demanded a free portal and then reported me for scamming",
		body = [[
I'm a mage. I've been a mage long enough to know how this goes, but this one was special.

I'm standing in Ironforge, doing absolutely nothing, and a level twelve warrior walks up to me. He doesn't say hi. He trades me. The trade window is empty.

He whispers me: "port darnassus."

I told him portals cost a rune of teleportation and I charge a small tip. He said "the tip is my friendship."

I said I have enough friends. He said "clearly you don't."

Then he asked for water. I made him water. He said "not that water, the good water." I explained that this is the only water I know how to make at my level. He said "wow ok, some mage you are."

So I portaled him. For free. I thought I'd be the bigger person.

I sent him to Stormwind by accident. Actually no. It was on purpose.

He reported me for scamming. The game master opened a ticket, looked at it, and wrote back: "Player was teleported. Working as intended." Then the GM asked me if I could make him some water.

I did. The good water.]],
	},
	{
		sub = "LetsNotMeet", user = "StranglethornSurvivor", ups = 143002, comments = 8805, age = "4d",
		search = "level 60 followed me in stranglethorn",
		title = "A level 60 rogue followed me through Stranglethorn Vale for three hours",
		body = [[
I was level thirty two, questing in Stranglethorn Vale, which if you don't know, is where the Horde goes to ruin your day.

I noticed him when I was killing raptors. A level sixty undead rogue, just standing on a hill. Not attacking. Watching.

I moved to the tiger quest. He was on a different hill. Watching.

Horde players ran at me three times that night. Every time, before they reached me, they fell over dead. I never saw what killed them. The rogue was always on a hill afterwards, cleaning his daggers.

I got scared. I hearthed to Booty Bay. When I walked out of the inn, he was sitting on the dock, fishing.

I finally whispered him. "Who are you? What do you want?"

He whispered back: "finish your homework before you log off."

It was my dad. My dad plays Horde. He's been playing since before I was born. He saw me leveling on the same server and decided to secretly protect me from every ganker in the jungle.

I asked him why he didn't just tell me. He said "because then you'd make me group with you, and I'd have to hear you pull with the mage."

He's still out there. On a hill. Watching.]],
	},
	{
		sub = "legaladvice", user = "CluckCluckHelp", ups = 29011, comments = 1904, age = "8h",
		search = "can i sue gnomish engineering",
		title = "Can I sue Gnomish Engineering? I've been a chicken for three days.",
		body = [[
Location: Ironforge, Tinker Town.

Three days ago I bought a Gnomish Mind Control Cap from a gnome named Fizzlecog. The sales pitch was "it controls minds, most of the time."

I put it on during a duel outside Orgrimmar. It did not control any minds. It made a sound like a kettle, and then I was a chicken.

I am still a chicken. The effect was supposed to last ten seconds. It has lasted seventy two hours. I cannot cast spells. I cannot open doors. I have been kicked from my raid for "not bringing enough to the table," which is rude, because I have laid four eggs.

I went back to Tinker Town. Fizzlecog said the product was working as described and pointed at a piece of paper that says "results may vary." The print was very small. I'm a chicken, so I couldn't read it anyway.

My questions:

One. Is the fine print legally binding if the customer is poultry?

Two. Can I get compensation for the eggs?

Three. A goblin lawyer offered to represent me for thirty percent of my eggs. Is that a normal rate?

Update: the goblin took the case. We lost. He kept the eggs.]],
	},
	{
		sub = "AmItheAzerothian", user = "ForTheHordeKinda", ups = 51220, comments = 7003, age = "1d",
		search = "sibling married a horde player",
		title = "AITA for not inviting my brother to my wedding because he rolled Horde?",
		body = [[
My brother and I (both late twenties) have played Alliance together since we were kids. Night elves. Matching purple hair. It was our thing.

Two years ago he rolled a blood elf. He said he "wanted to try something different." Then he rolled an orc. Then a tauren. Then he transferred his main to the Horde and started calling Stormwind "the stinky city."

Now I'm getting married in the Temple of the Moon in Darnassus. There's a problem. If my brother comes, the guards will attack him. On sight. Very loudly. At my wedding.

I suggested he come on an Alliance alt. He said, "I'm not going to level a character to twenty just to watch you get married." I said, "that's forty minutes." He said, "my time is valuable."

So I didn't invite him. Now he's telling our entire family I'm "faction racist." My mom thinks I should let him come and "just keep the guards busy." My dad logs on as Horde now too, apparently, so he's on my brother's side.

For the record, my fiancée is a gnome, and nobody made any comments about her. Well. Some comments. About the height. But that's different.

AITA?]],
	},
	{
		sub = "TrueOffMyChest", user = "LinenLord", ups = 66430, comments = 6002, age = "10h",
		search = "why is linen cloth so expensive",
		title = "I'm the reason linen cloth costs three gold on your server",
		body = [[
I have to get this off my chest before someone finds out.

Every day at five in the morning, I log into my bank alt. His name is not important. He is a gnome with no pants. I open the auction house, and I buy every single piece of linen cloth on the server.

Every piece. I've been doing this for years.

I don't need it. I don't craft anything. I don't even have tailoring. I just like knowing it's mine. I have eleven bank alts. They are all full of linen. They are all gnomes. None of them have pants, because I need the bag space.

I've seen people in trade chat asking "why is linen so expensive?" and "who is buying all the linen?" and once, "I will find you." I have never replied.

Last month a new tailor appeared on the server. Young. Hopeful. Wanted to make bandages for his friends. He posted a message: "anyone selling linen? will pay anything."

I stared at that message for an hour. Then I sent him one stack. For free. No note.

He made twenty bandages. He posted in trade: "thank you, mysterious stranger."

I'm not saying I've changed. I bought his leftover linen the next morning. But I felt something.]],
	},
	{
		sub = "antiwork", user = "StormwindGuard_Todd", ups = 187300, comments = 14002, age = "7h",
		search = "where is the deeprun tram",
		title = "I've been a Stormwind City guard for twenty years. Ask me for directions one more time.",
		body = [[
My whole job is to stand at the gate and give directions. That's it. For twenty years. They gave me a halberd, but I've never been allowed to use it on anybody who asks where the bank is.

Every single day, someone walks up to me and asks where the Deeprun Tram is.

It's in the Dwarven District. It has a giant sign. There is a gnome standing outside, shouting "tram, this way, tram!" There are rats. You can hear the rats.

Today, I had seventy four people ask me. One of them asked me twice. He came back ten minutes later and said "sorry, where was it again?" He was standing in the tram.

Here's the part that breaks me. When they click me, my little flag goes up above their map, pointing the way. The game literally draws it for them. And then they walk in the complete opposite direction. And they come back. And they ask me again.

I asked my captain for a transfer. He moved me to the Ironforge side of the tram. Guess what they ask me there.

I just want one person to ask me how I'm doing. Just once.

Edit: someone asked me how I'm doing. I cried. Then he asked me where the tram was.]],
	},
	{
		sub = "tifu", user = "FellOffTheElevator", ups = 44120, comments = 2560, age = "12h",
		search = "thunder bluff elevator death",
		title = "TIFU by trying to impress a girl on the Thunder Bluff elevator",
		body = [[
I'm a tauren. I'm very big. I'm also, apparently, very stupid.

So there's this night elf. Wait, no, she's a blood elf, I'm Horde. She's standing at the bottom of the Thunder Bluff elevator, and I see her, and I think "this is my chance to be cool."

I get on the elevator. It starts going up. I wave at her. She waves back. My heart is doing things.

At the top, I decide to show off. I have a slow fall ability? No. I do not. I'm a warrior. I have never had a slow fall ability. But in the moment I remember that the druid in my guild jumps off here all the time, and I think "how hard can it be."

I jumped. I did a little spin in the air. I said "watch this" in say chat.

I died instantly. Like, instantly. I landed about three feet from her. My body bounced.

She typed "lol." Just "lol."

Then she resurrected me. She was a priest. She said "you're lucky I was here." And I said "was I, though?"

We're married now. In the game. It's a long story. The toast at our wedding was a video of me jumping.]],
	},
	{
		sub = "relationship_advice", user = "CatFormBoyfriend", ups = 31045, comments = 4400, age = "2h",
		search = "druid boyfriend always in cat form",
		title = "My boyfriend (24M) turns into a cat every time we argue",
		body = [[
My boyfriend is a druid. When we met, I thought that was a fun detail. Now it's the whole problem.

Every time we have a disagreement, he shapeshifts into cat form. Then he goes into stealth. Then he just stays there. Somewhere in the room. I can hear him purring.

Last week I asked him to do the dishes. He went cat. I stood in the kitchen for twenty minutes saying "I know you're here." He was on the fridge.

When I ask him about our future, he turns into a bear and says he's "tanking the conversation." When I try to have a serious talk, he turns into a tree and says he can't talk because he's photosynthesizing.

He turned into a seal once. We live in Orgrimmar. There is no water. He just flopped.

My friends say I should give him an ultimatum. The problem is if I give him an ultimatum he will turn into a bird and fly to Moonglade, because as a druid he has his own teleport, and he "needs space to reflect." He has been to Moonglade four times this month.

How do I get him to stay in caster form long enough to have one conversation?

Edit: he read this post. He's a cat right now.]],
	},
	{
		sub = "MaliciousCompliance", user = "TenBoarLivers", ups = 58812, comments = 3911, age = "1d",
		search = "why do boars not have livers",
		title = "Quest giver said \"collect ten boar livers.\" He didn't say how many boars.",
		body = [[
There's a quest in Redridge. A guy named Chef Breanna, or somebody, I don't remember, wants ten boar livers for a stew.

Simple, right? Every boar has a liver. That's how boars work.

I killed the first boar. No liver. I killed the second boar. No liver. By boar thirty, I had two livers. I started asking questions. Where are the livers going? Are these boars okay?

By boar ninety four, I had six livers. At this point, other players were watching me. A hunter offered to help. We killed boars together. Then more people came. By boar two hundred, there was a whole community. Somebody started a spreadsheet.

The spreadsheet concluded that roughly one boar in fourteen has a liver. The rest of them, scientifically, just don't. Nobody knows how they live. Nobody knows how they process anything.

We finished the quest at boar two hundred and eleven. I turned in ten livers. The quest giver said, "thanks, these will do nicely." He gave me three silver and a pair of pants.

I didn't need the pants. I did need answers.

Redridge boar population is now zero. The spreadsheet guy is doing a thesis.]],
	},
	{
		sub = "weddingshaming", user = "GoldshireGuest", ups = 72400, comments = 5230, age = "3d",
		search = "goldshire wedding ganked",
		title = "Bride insisted on a Goldshire wedding. The Horde was not invited. The Horde came anyway.",
		body = [[
Let me set the scene. A human paladin and a human priest decide to get married. The bride insists on Goldshire. "It's where we met," she says. I will not say what else happens in Goldshire, but everybody knows.

Forty guests. Everybody in their best tuxedo and dress. The groom is on a white horse. The priest doing the ceremony is a dwarf who keeps saying "aye" at weird moments.

Right when they say "you may kiss the bride," we hear it. The sound. A horn. Horde.

The bride's ex boyfriend had rolled an undead rogue and leveled him to sixty just for this. He brought his whole guild. Forty undead. Everybody in tuxedos. They had matching tuxedos. It was coordinated.

The wedding became a battleground. The groom died first. The bride fought for eleven minutes, alone, in a white dress, with a two handed mace.

The Stormwind guards showed up, eventually, and also died.

Afterwards, the ex sat down on the bench and typed "I object." The bride typed back "that's supposed to be before the kiss."

They're dating again. Our guild doesn't talk about it.]],
	},
	{
		sub = "nosleep", user = "LastTramToGnomeregan", ups = 99231, comments = 6120, age = "5d",
		search = "deeprun tram doesn't stop at ironforge",
		title = "The Deeprun Tram doesn't stop at Ironforge anymore",
		body = [[
I take the tram every day. Stormwind to Ironforge, Ironforge to Stormwind. The ride takes about a minute. You can see fish through the glass. It's peaceful.

Last Tuesday I got on the tram in Stormwind like always. It started moving. The fish were there. Then the fish stopped moving. They just hung in the water, looking at us.

The ride kept going. One minute. Two minutes. Ten minutes. The other passengers didn't seem to notice. A gnome across from me was reading a newspaper upside down.

I asked him, "shouldn't we be in Ironforge by now?"

He lowered the paper very slowly. He smiled. He had too many teeth for a gnome.

"Next stop," he said, "Gnomeregan."

I looked out of the window. The glass was no longer glass. It was a screen. On the screen was a person, sitting in a chair, looking at a small window showing a little character running through a tunnel, jumping over barriers, collecting coins.

The person was listening to a story.

I think the person was you.

Please don't look behind your character right now. The rat is getting closer.]],
	},
	{
		sub = "pettyrevenge", user = "ThankYouForYourService", ups = 84023, comments = 4812, age = "20h",
		search = "ninja looter revenge mail",
		title = "Guy ninja-looted my Cruel Barb, so I sent him one copper a day for three years",
		body = [[
Deadmines. I'm a rogue. The Cruel Barb drops. It's the best sword in the dungeon for me. The warrior rolls Need. He's a warrior who uses a shield and a one handed mace. He rolls Need on a rogue sword. He wins. He leaves the group immediately.

I decided I would not report him. Reporting is too easy. Instead, I sent him a letter. With one copper attached. The letter said: "Thank you for your service."

The next day, I sent another. One copper. "Thank you for your service."

Every day. For three years.

At first he replied. "who is this." Then, "stop." Then, "I will report you." But I wasn't breaking any rules. I was thanking him. With money.

About a year in, he stopped replying. But his mailbox was always full. He couldn't receive any real mail because it was full of my copper. His auction house sales were bouncing. Someone told me he missed a guild summons because the letter never arrived.

Then last week, he finally replied. "I sold the Cruel Barb years ago. I got two silver for it. You have sent me eleven silver."

He is right. I have spent more money on revenge than the sword was worth.

I sent him one more copper today. Some things are bigger than math.]],
	},
	{
		sub = "tifu", user = "MomSaidNoRaid", ups = 57006, comments = 2991, age = "4h",
		search = "mom called police raid",
		title = "TIFU by telling my mom I couldn't come to dinner because I was \"in a raid\"",
		body = [[
I'm seventeen. I live with my mom. She doesn't play games. She thinks computers are "the thing with the email."

Last night she called me down for dinner. I shouted back, "I can't, mom, I'm in a raid!"

Then there was silence. A long silence. The kind of silence you only hear right before something terrible happens.

What I didn't know is that she heard "I'm in a raid" and assumed I meant a police raid. Like, happening in my room. She did not ask follow up questions. She called the actual police.

Twenty minutes later, three officers are standing in my doorway, looking at me, sitting at my computer, wearing headphones, shouting "no, heal the tank! heal the tank!"

One officer asked, "son, who's the tank?"

I pointed at the screen. He leaned in. He looked for a long time. Then he said, "your warlock's standing in fire."

Turns out he played in 2008. He sat down. He gave everybody tips. We killed the boss. My guild wants him to join now. He said he'd think about it.

My mom made everybody dinner. She still thinks I was in trouble. I kind of was.]],
	},
	{
		sub = "EntitledPeople", user = "GoblinAuctioneer_Ricki", ups = 42300, comments = 3120, age = "9h",
		search = "can i speak to the trade prince",
		title = "Customer at the auction house demanded to speak to the Trade Prince",
		body = [[
I'm a goblin. I work at the Booty Bay auction house. My job is to take your item, take a fee, and hand you nothing, and I love it.

Yesterday a human woman walks up. She has a very specific haircut. She wants to sell one Copper Ore. One. She wants a buyout of one hundred gold.

I explain that the deposit for her auction is five percent. She says she doesn't pay fees. I explain that everyone pays fees. She says, "do you know who I am?"

I did not know who she was. She told me. She's a level fourteen priest. She said it like it was a royal title.

Then she asked to speak to my manager. I told her my manager is the auction house. She asked to speak to his manager. I told her that's the Trade Prince, Gallywix, and he doesn't speak to customers. He speaks to money.

She said "then I'll speak his language." She put the Copper Ore on my desk.

Somehow, and I'm not joking, the Trade Prince showed up. He looked at the ore. He looked at her. He said "time is money, friend." Then he took the ore and left.

She got nothing. He got the ore. I got a promotion. Honestly this was the best day of my life.]],
	},
	{
		sub = "Advice", user = "ForsakenRoommateProblems", ups = 36702, comments = 2402, age = "1d",
		search = "undead roommate arm in fridge",
		title = "My roommate is Forsaken and keeps leaving his arm in the fridge",
		body = [[
I'm a troll. I moved to the Undercity for work. The rent was cheap because, well, it's the Undercity. My roommate is a Forsaken named Gerald. He's very polite. He is also falling apart.

Last week I opened the fridge and his left arm was in there. Just lying on the middle shelf, next to my milk. There was a note stuck to it: "don't touch, keeping it fresh."

I asked him about it. He said his arm was "coming loose" and the cold helps it stay together. I said that's fine, but can you put it in a container? He said "I'm not made of containers."

It gets worse. Yesterday I found an eye in the ice tray. Today his jaw was on the couch. He called me, and I could hear him, but I could also see his jaw on the couch.

I don't want to be rude. He cooks. He cleans. He pays rent on time. He's the best roommate I've had. The last one was an orc who kept "accidentally" setting things on fire during "shaman practice."

But I can't keep drinking milk that's been sitting next to Gerald's arm.

How do I bring this up without making him feel bad about being dead?

Edit: I talked to him. He agreed to buy a second fridge. It's just for him. It's labeled "Gerald parts."]],
	},
	{
		sub = "AmItheAzerothian", user = "PetNamedAfterEx", ups = 45109, comments = 8114, age = "13h",
		search = "can you rename hunter pet",
		title = "AITA for naming my hunter pet after my ex and then abandoning it in Elwynn Forest?",
		body = [[
My ex and I broke up after four years. She said I cared more about my hunter than I cared about her. Which, honestly, was fair. But still.

After the breakup, I tamed a wolf in Elwynn Forest. I named it after her. I'm not going to say the name here, but it's a pretty common name. Let's say it's a name that rhymes with "Tessica."

I leveled that wolf to forty. She was a good wolf. Loyal. Fed on time. Better communication than my ex. Then, one day, I just walked her back to Elwynn and clicked "abandon pet."

I said goodbye. She sat down in the grass and looked at me. It was very emotional. More emotional than the breakup, if I'm being honest.

Here's where I might be the jerk. My ex also plays. She was leveling a new character in Elwynn Forest. She ran into a wolf. It had her name. It was level forty. In a level ten zone.

It killed her. Fourteen times. She sent me a very long message. The message was mostly letters I can't repeat.

My friends say it was poetic. Her friends say it was psychological warfare. The wolf says nothing because she is now wild and free.

AITA?]],
	},
	{
		sub = "wow", user = "MurlocRightsNow", ups = 12402, comments = 9913, age = "22h",
		search = "are murlocs actually evil",
		title = "Unpopular opinion: the murlocs are right",
		body = [[
Hear me out before you downvote.

Every day, adventurers walk into murloc villages. Murloc villages that were there first. Built with their own little fins. And they kill everybody inside. For what? For a quest that wants eight murloc fins, and somehow only one murloc in five has fins. They are called murlocs. Where are the fins going?

Now think about it from the murloc side. You're minding your business. Grilling a fish. Some guy in a dress runs up and hits you with a stick. You call your friends. That's what anybody would do. And everybody says "oh no, the murlocs pulled the whole camp." Yes. That's called community.

And the noise. People complain about the noise. That noise is language. They are saying something. You just never stopped to listen.

I learned it. It took three years. What they're saying is: "mrglglglgl."

Which translates to: "please leave our village."

So next time you're in Westfall and you hear that sound, remember. They asked nicely.

Mrglglglgl.

Edit: Mrgl. Mrglgl glglgl. Thank you for the gold, kind stranger.]],
	},
	{
		sub = "relationship_advice", user = "SecretGnomeHusband", ups = 69882, comments = 7003, age = "8h",
		search = "husband secretly plays a gnome",
		title = "My (30F) husband (32M) has been secretly playing a gnome for our entire marriage",
		body = [[
For seven years, my husband has told me he plays a tauren warrior. Big, strong, noble. He has a whole backstory. The tauren's name is Thunderhoof. He talks about Thunderhoof at dinner. Our dog is named after Thunderhoof.

Last night, he fell asleep at his desk. I went to turn off his computer. On the screen was a gnome. A pink haired gnome, in a tiny dress, dancing on a mailbox in Ironforge.

Her name is Sprinklefizz.

I checked his character list. There is no Thunderhoof. There has never been a Thunderhoof. There are nine gnomes. All different colors. All dancing.

I woke him up. I asked him to explain. He looked at the screen, then at me. And he said, very quietly, "I'm vertically efficient."

He says he was scared I'd judge him. He says he started with a tauren, but on his first day he saw a gnome dancing and "felt something he couldn't explain." He says Thunderhoof was a "character he played for me."

I don't even know what to be mad about. The lying? The dancing? The fact that Sprinklefizz is level sixty and I'm level thirty one?

My sister says to leave. My mom asked if the gnome was single.]],
	},
	{
		sub = "tifu", user = "SwamToStormwind", ups = 27300, comments = 1870, age = "2d",
		search = "can you swim to stormwind",
		title = "TIFU by refusing to take the tram and swimming to Stormwind instead",
		body = [[
I'm a dwarf. I'm claustrophobic. Yes, I know, I'm a dwarf. We live in a mountain. It's complicated.

I needed to get from Ironforge to Stormwind. Everybody said to take the tram. I looked at the tram. It's a metal box, under the sea, in a glass tube, designed by gnomes. I said no.

So I decided to go the old way. Down to Menethil Harbor, and then I'd just... swim. How far can it be? It's on the same map.

It's very far. It's very, very far.

After six minutes, I ran out of breath and nearly drowned. I found a bubble. After twenty minutes, I got fatigued, because apparently the ocean has a border, and the game doesn't want you there. I turned around. I found a different route. I swam past a sea giant. He looked at me like I was an idiot.

Two hours later, I crawled out of the water in Westfall. I was level eighteen. I had started at level seventeen. I leveled up from swimming alone.

I walked the rest of the way to Stormwind. At the gates, the guard asked "did you not know about the tram?"

I cried. He gave me directions to the tram.]],
	},
	{
		sub = "AskAzeroth", user = "DumbestDeathThread", ups = 91004, comments = 24112, age = "1d",
		search = "dumbest way to die in wow",
		title = "What's the dumbest way you've ever died? Top answers inside.",
		body = [[
I asked this yesterday and the answers were incredible, so here are my favorites.

Number one. "I jumped off the zeppelin tower in Orgrimmar because I thought the zeppelin was there. The zeppelin was not there. The zeppelin is never there."

Number two. "I drowned in the Deeprun Tram trying to get a closer look at a fish. The fish was a texture."

Number three. "I was a warlock. I used Hellfire. I forgot that Hellfire hurts me. I was alone. There were no enemies. I was testing it."

Number four. "Fell off the lift in Thunder Bluff. Then again. Then again. Then my spirit healer asked if I was okay."

Number five. "I pulled a single wolf in Elwynn Forest while level sixty. It crit me. I didn't die. I just typed 'lol' in chat. Then I walked into the lake and got stuck on a rock and drowned while typing a second 'lol.'"

Number six. "Mind controlled a guard in Stormwind to make him dance. He killed me. The other guards killed me. The dance was not worth it."

And number seven, my own. "I was listening to a story on my flight path and forgot I wasn't actually on a flight path. I walked into Hogger."

Tell me yours.]],
	},
	{
		sub = "BestofRedditorUpdates", user = "OP_is_a_Gnome", ups = 76300, comments = 5602, age = "3d",
		search = "husband left me for night elf priestess update",
		title = "UPDATE: My husband left me for a night elf priestess he met in Ashenvale",
		body = [[
Original post: my husband of five years told me he'd fallen in love with a night elf priestess named Moonwhisper. They met while questing in Ashenvale. He said she "understood him in a way I never could." He moved his main to her guild and stopped logging in with me.

Many of you asked me to find out who Moonwhisper really was. So I did.

I made a level one night elf. I went to Darnassus. I asked around. Moonwhisper was well known. She was in a guild called Tears of Elune. She sold herbs. She had very nice purple hair.

I sent her a whisper. She wrote back instantly. Very friendly. Too friendly. The way she typed felt familiar. Lots of dots. Lots of "hehe."

Then she used a phrase. "Just a smidge." Only one person I know says "just a smidge."

Moonwhisper is my brother.

He was bored. He said it started as a joke. He said he "never thought it would go this far." My husband has spent four hundred gold on him. Most of it on herbs.

My husband is back now. He's very quiet. My brother still sends him herbs on his birthday.

Edit: yes, I kept the night elf. She's level twelve. She's doing great.]],
	},
	{
		sub = "tifu", user = "SubwaySurferOnGryphon", ups = 250442, comments = 33120, age = "just now",
		search = "addon that plays subway surfers on flight paths",
		title = "TIFU by installing an addon that turns my flight paths into TikTok",
		body = [[
My friend told me about an addon. He said, "it turns your flight paths into content." I laughed. I installed it.

The next time I took a gryphon from Ironforge to Stormwind, a little phone appeared on my screen. My character was inside it. Running through the Deeprun Tram. Jumping over barriers. Collecting coins. A robot voice started reading a story about a hunter who rolled Need on Thunderfury.

I was hooked. I started taking flight paths just to hear more stories. Flight paths I didn't need. Southshore to Refuge Pointe, and back, and back again. I have not done a quest in two weeks.

My guild asked where I was. I said "on a flight path." They said "which one?" I said "yes."

Yesterday, I realized something. The little character on the phone has started running a bit slower. And the rat behind him has been getting a little closer every flight.

I don't know what happens when the rat catches up. I don't want to know.

But I can't stop. I need to know if the peon union survived.

If you're hearing this right now, you already know what I mean. Follow for part two.]],
	},
	{
		sub = "AmItheAzerothian", user = "DancingIsNotHealing", ups = 33902, comments = 4999, age = "15h",
		search = "healer only dances",
		title = "AITA for telling our healer that /dance is not a heal?",
		body = [[
Our guild recruited a new healer last month. A human priest. Very enthusiastic. Very sparkly outfit. Every time we pull, she dances.

At first I thought it was a warm up. Like stretching. Then the tank started taking damage. She kept dancing. The tank went to half health. Still dancing. The tank died. She stopped, looked at his body, and did the "cry" emote.

After the wipe I asked her, politely, what her rotation was. She said "dance until they feel better." She said it was "a vibe based healing style."

I told her, as nicely as I could, that the /dance command does not restore any health. She said "not with that attitude."

Here's the problem. Our raid leader likes her. He says our morale has "never been higher." He says we are "a family." We have not killed a boss in four weeks. The family keeps dying.

Last night we wiped eleven times. After the last wipe, while everyone was dead on the floor, she danced over our corpses. The raid leader said "see, that's leadership."

I said, in raid chat, "dancing is not a heal." Now half the guild says I'm negative and toxic. The other half is dead.

AITA?]],
	},
	{
		sub = "confession", user = "IAmTheFishAtTheGlass", ups = 118700, comments = 10300, age = "6d",
		search = "fish in deeprun tram knocking",
		title = "I'm the fish that knocks on the Deeprun Tram glass",
		body = [[
Hi. I'm a fish. I live in the water around the Deeprun Tram. I'm writing this with my fin, so please forgive any typos.

For years, I've watched you. You get on the tram. You stand in the metal box. You press your face against the glass. Some of you wave at me. Most of you don't even notice me. You're looking at your map.

So I started knocking. Knock knock knock. Just to say hello.

Then I heard the night shift gnome say "that's a fish" out loud, every single time, very fast, very scared. I realized there's a rule about me. I'm on a card. They made a card about me.

I just wanted a friend.

So today I'm making a statement. Yes, I'm the fish. I knock because I'm lonely. The water is cold. The other fish just swim in circles because they're on a path. I'm the only fish with free will, and it's lonely at the top.

To the gnome on the night shift: you're doing great. I'm sorry I scared you. I'm also sorry about the lamp thing. That wasn't me. I don't know what that was.

Please wave next time. I'll knock twice.]],
	},
}
