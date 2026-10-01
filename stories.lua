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
	{
		sub = "MaliciousCompliance", user = "EightOhFive", ups = 91230, comments = 4410, age = "11h",
		search = "raid leader late rule",
		title = "Raid leader said anyone late gets locked out. Then he was late.",
		body = [[
Our raid leader has one rule. Raid starts at eight. At eight oh five, he closes the group. If you're not inside the instance, you're not in the raid. No exceptions. Not for traffic. Not for dinner. Not for a dwarf who, and I quote, "was stuck behind a slow ram."

He enforces it hard. Last month our main tank was two minutes late because his cat sat on his keyboard. The raid leader replaced him with a warrior from trade chat who wore no pants.

So last Tuesday, it's eight oh four. Everybody is inside Blackwing Lair. Everybody except the raid leader.

His assistant, a quiet gnome mage, looked at the clock. She looked at us. She typed: "rules are rules."

At eight oh five, she promoted herself, closed the group, and pulled the first boss.

The raid leader logged in at eight oh seven. He whispered every one of us. "Let me in." "Guys." "This isn't funny." "I am the raid."

We cleared three bosses that night. Our best night in months. The gnome called the pulls in a calm little voice. Nobody stood in fire.

At the end, the raid leader posted in guild chat. "The late rule is cancelled, effective immediately."

The gnome replied: "Effective eight oh five."

She's the raid leader now.]],
	},
	{
		sub = "pettyrevenge", user = "SummonedInMyPajamas", ups = 47720, comments = 2210, age = "1d",
		search = "guild master summons me every morning",
		title = "My guild master summoned me to farm at six every morning. So I learned to summon him.",
		body = [[
Our guild master is a paladin who wakes up at five thirty and believes everyone else should too.

Every morning at six, I get a pop up. Someone is summoning me. It's him. I accept, because I'm scared of him. I appear in Silithus. In my pajamas. My character wears pajamas too. He has a robe for it.

"Farm time," the guild master says. We farm for two hours. Every day.

After three weeks, I had a plan. I'm a warlock. Warlocks can summon people too. You just need two friends to click the portal. My roommates don't play, so I paid them in pizza.

I also knew one thing about the guild master. He has an addon that accepts every summon automatically, because, quote, "a real leader is always ready."

At three thirty in the morning, my roommates and I stood in the middle of a murloc camp in Westfall. We clicked the portal.

He appeared. Asleep. Not moving. In the middle of forty murlocs.

You know the sound. Everybody knows the sound.

The next morning he logged in to a repair bill of eighty gold and a mailbox full of fins. He didn't say anything. He just looked at me for a long time.

He summons me at nine now. I can do nine.]],
	},
	{
		sub = "ProRevenge", user = "PeaceblooMyLand", ups = 102300, comments = 6480, age = "2d",
		search = "neighbor stealing herbs player housing",
		title = "My neighbor kept picking my Peacebloom hedge. So I hired a dwarven surveyor.",
		body = [[
When player housing came out, I bought a little plot in Elwynn Forest. Small cottage. Herb garden. My pride and joy was a hedge of Peacebloom along the edge of my yard.

My neighbor is a human warrior named Brad. Brad has a giant statue of himself on his lawn. Brad decided my Peacebloom was "on his side."

Every morning, my hedge was gone. Brad was an herbalist. He was picking it. He was selling it. To me. On the auction house. I bought my own Peacebloom back twice before I noticed.

I asked nicely. He said, "fences don't lie." There was no fence.

So I hired a surveyor. A dwarf named Thurgrim. He came with a measuring chain, a brass telescope, and a flask. Mostly the flask. He walked the property for six hours, muttering.

His report was clear. My Peacebloom was on my land. So was Brad's statue. So was half of Brad's house, including the front door. Brad had been living in my house for a year.

The housing board gave me two options. Charge rent, or remove the structures.

I chose rent. Brad pays me forty gold a month to live in his own kitchen. The statue now faces my cottage. I put a little hat on it.

The Peacebloom grows back every morning. Brad doesn't pick it anymore. He waters it.]],
	},
	{
		sub = "AmItheAzerothian", user = "TrollOnTheRailing", ups = 38810, comments = 5120, age = "7h",
		search = "tauren sleeping on zeppelin deck",
		title = "AITA for asking a tauren to stop lying down across the entire zeppelin?",
		body = [[
The zeppelin from Orgrimmar to the Undercity is not big. There are maybe ten good spots on the deck, and none of them have chairs.

I get on. I'm a troll. I'm tall. I find a nice spot by the railing. Then a tauren gets on. He walks to the middle of the deck and types the sleep emote.

He lies down. A tauren lying down is the size of a small house. He takes up half the deck. His hooves are in my space. His tail is on my foot.

I asked him to sit up. He said, "I paid for this zeppelin." Nobody pays for the zeppelin. The zeppelin is free.

Then he started snoring. In say chat. He typed "zzz" every ten seconds.

Everybody else got squeezed to the edges. A gnome fell off. We were over the ocean. We did not see him again.

Then the goblin captain came down. He looked at the tauren. He looked at me. He said, "you. Come with me."

I thought I was in trouble. He took me up to the crow's nest. It had a chair. It had a view. It had a little bowl of snacks.

"Upgrade," he said. "For passengers who don't make my deck look like a pasture."

I spent the rest of the trip up there, eating snacks, watching the tauren roll overboard when the zeppelin turned.

His friends say I should have just let him sleep. AITA?]],
	},
	{
		sub = "AmItheAzerothian", user = "KneeledInLava", ups = 56340, comments = 9120, age = "16h",
		search = "proposed during raid boss kill",
		title = "AITA for proposing to my girlfriend during our guild's first Ragnaros kill?",
		body = [[
My girlfriend and I have raided together for three years. She's a priest. I'm a warrior. We met in Molten Core, so I thought, what better place to propose.

The plan was simple. Ragnaros dies. Everybody cheers. I kneel, and I ask.

Ragnaros was at two percent. I was so excited I hit the kneel emote early. My warrior knelt. In the lava. Facing the wrong way.

It turns out kneeling stops you from attacking. I was the main tank. Ragnaros looked down at me, kneeling, not hitting him. Then he looked past me at my girlfriend. He hit her with the hammer.

The raid wiped at one percent. Our closest attempt ever. Forty people dead on the floor, in the lava. And my ghost, floating above them all, typing in raid chat: "will you marry me?"

Silence. Then the raid leader typed, "is this a hostage situation?"

She said yes. Thirty eight people said "congrats." One person said, "you owe me a Thunderfury."

We killed Ragnaros the next week. Nobody let me tank. The guild says I made the kill about me. My girlfriend says I made it about her, which is worse.

AITA?]],
	},
	{
		sub = "Parenting", user = "ChildrensWeekVictim", ups = 63100, comments = 3870, age = "3d",
		search = "children's week orphan wants ice cream",
		title = "I adopted an orphan for Children's Week and I think he's running a scam",
		body = [[
Every year, the Stormwind orphanage lets adventurers look after an orphan for a week. A little kid follows you around. You take him places. It seemed wholesome. I signed up.

My orphan's name is Randis. He's about ten. He has the face of a small accountant.

Day one, he wanted to see the Deeprun Tram. Fine. Day two, he wanted an ice cream. A specific ice cream, from a specific vendor, in a different city. Day three, he wanted to meet a famous hero. I took him to Ironforge to see the king. He asked the king for money. The king gave him money.

Day four, he asked to see Onyxia's Lair. I said no. He cried in public. A crowd formed. A paladin said "shame." I took him to Onyxia's Lair.

Day five, I caught him selling my potions on the auction house. He said it was "for the orphanage." The orphanage has never seen that money.

Day six, he asked if he could stay a little longer. I said that's sweet. He said, "I mean in your house. My stuff is already there."

At the end of the week, I returned him. The matron hugged him. He waved at me. Then he took a new adventurer's hand and walked her straight to the ice cream vendor.

He's been an orphan for nineteen years. He's the richest person in Stormwind.]],
	},
	{
		sub = "namenerds", user = "NotNamingHimArthas", ups = 44920, comments = 8803, age = "5h",
		search = "husband wants to name baby arthas",
		title = "My husband wants to name our son Arthas. He says it's a strong prince name.",
		body = [[
I'm eight months pregnant and we still don't have a name. Every name I suggest, my husband vetoes. Every name he suggests is from a video game.

His first suggestion was Arthas. I liked it at first. It's unusual. It sounds royal. Then I looked it up.

Arthas was a prince. He burned down a city. He killed his father. He became the Lich King and turned half the continent undead. My husband says that's "only the second half of his story," and "the first half was very promising."

His other suggestions: Illidan, who betrayed everyone. Garrosh, who betrayed everyone, but louder. And Gul'dan, which he says is "basically Gordon."

I suggested Varian. A good king. Strong. Loved his son. My husband agreed immediately. Too quickly.

Then I learned that Varian's son is named Anduin. I said Anduin is pretty. My husband said, "yes. Anduin is great." Then, very quietly, "and his middle name could be Arthas."

We're naming him Anduin. No middle name. I'm filling in the birth certificate personally.

Edit: the baby is here. He's perfect. My husband just held him up to the window and whispered, "all I ever wanted was to protect you."

I know that line. I'm watching him.]],
	},
	{
		sub = "antiwork", user = "MediumSizedBird", ups = 154200, comments = 9930, age = "9h",
		search = "do flight path gryphons get breaks",
		title = "I'm a flight path gryphon. Twenty years of passengers, not one break.",
		body = [[
People think gryphons have it easy. You fly. You see the world. You ride the wind.

Here's my actual day. Somebody walks up to the flight master. They click Ironforge. I don't get a choice. I take off.

They sit on my back for four minutes. Sometimes eight. They don't talk to me. They don't look at the view. Most of them go AFK to make a sandwich. One guy fell asleep and drooled on my neck from Southshore to Menethil.

I'm not allowed to land until we arrive. Not for water. Not for a bathroom break. If you've ever seen a gryphon fly a strange zigzag over the Wetlands, now you know why.

The pay is nothing. The flight master keeps the gold. I get a bucket of fish at the end of the night. The fish come from the Deeprun Tram water. I've seen what lives in that water.

Last week, a passenger complained the trip was "too slow." He was a dwarf in full plate armor, carrying a cannon. I'm a medium sized bird.

So I took a new route. Scenic. Through every zone between Ironforge and Stormwind, including the Burning Steppes. He landed on fire.

I'm being "retrained" now. But the other gryphons heard about it. We have a group chat.

We're thinking about a strike. Imagine the flight paths. Imagine everybody walking.]],
	},
	{
		sub = "TalesFromYourServer", user = "GoldshireInnkeep", ups = 71250, comments = 3310, age = "1d",
		search = "raid group camped the inn",
		title = "Forty raiders walked into my inn five minutes before closing and ordered water",
		body = [[
I'm the innkeeper in Goldshire. I've seen things. Most of them I can't talk about. But this one was the worst.

Ten fifty five at night. I'm wiping the counter. The door opens, and they just keep coming in. Forty people. Full armor. Mounts parked outside on my flowers.

The raid leader walks up and says, "table for forty, please." I have six tables. One of them is the table where the man in the dress sits. Nobody sits at that table.

They order forty waters. Then the mage at the back conjures his own water and starts handing it out. In my inn. That's like bringing your own food to a restaurant.

Then the raid leader asks me to set their hearthstones. All forty. Each one is a separate conversation. "Would you like to make this inn your home?" "Yes." Forty times.

At midnight, they finally leave. Not to go home. They walk to the corner and start a dance party. The bard plays until four.

The tip, on the table, was one copper and a gray item called "Broken Fang."

The next night, they came back. Same time. They said, "we live here now."

Technically, according to their hearthstones, they do.]],
	},
	{
		sub = "AmItheAzerothian", user = "ChiliStrike", ups = 52870, comments = 6640, age = "13h",
		search = "raid food buff stopped cooking",
		title = "AITA for refusing to cook for the raid after my husband called my chili \"a bit much\"?",
		body = [[
I'm the cook in our guild. I maxed out cooking before anybody else. Every raid night I make forty bowls of Dragonbreath Chili, plus fish for the tanks, plus soup for the healers. It takes an hour. Nobody has ever said thank you, except one gnome who said it to the soup.

My husband is our raid leader. Last week, in front of everyone in voice chat, he said, "babe, the chili's a bit much tonight. It's not like my mom's."

His mom is a dwarf. She makes one thing. It's beer. In a bowl.

So I stopped cooking. I didn't announce it. I just didn't bring food.

The raid lost the food buff. Nobody noticed at first. Then the tanks started dying a bit faster. Damage went down a few percent. We wiped on a boss that's been on farm for six months.

The raid leader asked in voice chat, "why does everyone feel weak tonight?" I said nothing. I ate a sandwich. In front of everybody. Alone.

After the third wipe, he whispered me. "Please. The chili. I'm sorry."

I said, "not sorry enough to say it in raid chat?" He said it in raid chat. Then guild chat. Then trade chat, for some reason.

I'm cooking again. But his bowl is extra spicy now. He doesn't complain. He just cries a little while he eats it, and then he does great damage.]],
	},
	{
		sub = "AskAzeroth", user = "WhyDidMyGuildDie", ups = 88010, comments = 12440, age = "8h",
		search = "why do guilds fall apart",
		title = "Serious question: why did my guild fall apart after twelve years?",
		body = [[
My guild was together for twelve years. We survived every expansion, every drama, every breakup. Then last month, everybody just stopped logging in. I don't understand. Can someone help me make sense of it?

Top comment, with nine thousand upvotes:

Guilds rarely end in one moment. It's usually slow. The raid leader burns out first, because he's been doing spreadsheets for a decade and nobody ever thanked him. The healers notice before anyone else, because they watch everybody's health bars all night, and they see the tiredness. Then the officers start arguing in private channels about loot rules that haven't mattered for years. People stop showing up on Thursdays. Then on Tuesdays.

Your guild didn't die because anybody was a bad person. It died because people change, and life moves on, and that's okay. The important thing is to remember the good times, and to know that, in two thousand ten, the Lich King threw Tirion Fordring off the top of Icecrown Citadel, and he plummeted sixteen feet through an announcer's table.

Reply from the original poster: I read this whole thing nodding. I was crying a little. I can't believe I fell for it again.]],
	},
	{
		sub = "IAmA", user = "TotallyPrinceArthas", ups = 133400, comments = 21800, age = "2d",
		search = "arthas ama frostmourne",
		title = "I am Prince Arthas Menethil, here to talk about my new sword. Ask me anything!",
		body = [[
Hello everyone. I'm Arthas, crown prince of Lordaeron, currently the Lich King. I'm here today to talk about my new sword, Frostmourne. Ask me anything!

Top question: "Why did you burn Stratholme?"

Answer: "Let's keep the questions on Frostmourne, please."

"Did you really kill your own father?"

"Great question. Frostmourne is a runeblade, forged in the Shadowlands. It hungers."

"What happened to your horse, Invincible?"

"I'd prefer to talk about Frostmourne."

"Jaina says you never called her back."

"Frostmourne holds a lot of souls. It's very exciting."

"Okay. Tell us about Frostmourne."

"I'd rather not get into specifics."

"Do you have any regrets?"

"Only that this isn't about Frostmourne."

"Is Frostmourne for sale?"

"No. But it might be in a few years. Possibly in pieces. Ask Tirion."

Edit: thank you all for the wonderful questions. Frostmourne is available for preorder now. Lordaeron, I'll see you soon.]],
	},
	{
		sub = "StoriesAboutKevin", user = "KevinsRaidLeader", ups = 66120, comments = 4020, age = "10h",
		search = "gnome engineer kevin",
		title = "Kevin is the gnome engineer in our guild",
		body = [[
Every guild has a Kevin. Ours is a gnome engineer. His name is actually Kevin. He did not change it for the game. He said, "it's my name, why would I change it."

Kevin has the Goblin Jumper Cables. They bring someone back to life, sometimes. Kevin used them on a boss. He said he wanted to "check if it was really dead." It was not anymore.

Kevin once asked what "line of sight" meant. We told him: stand behind the pillar. He walked behind a pillar. The pillar was in the next zone.

Kevin bought the most expensive mechanical mount on the server. He used it once, in Ironforge, and it exploded. Kevin was fine. The mailbox was not.

Kevin asked us why his health kept going down. He was standing in fire. We told him to move. He moved deeper into the fire. He said, "I'm committed now."

But the best Kevin story is the Gnomish Universal Remote. It's supposed to control a mechanical creature for a few seconds. It fails most of the time. Kevin pointed it at the raid leader. A night elf. Not mechanical. Not even a little bit.

It worked.

Kevin controlled the raid leader for ten seconds. He used all ten to make him dance.

Nobody knows how he did it. Kevin doesn't know either. We love Kevin.]],
	},
	{
		sub = "talesfromtechsupport", user = "GameMaster_Ellowyn", ups = 79400, comments = 3120, age = "1d",
		search = "game master ticket stuck",
		title = "I've been a Game Master for fifteen years. This is the ticket that broke me.",
		body = [[
Most tickets are simple. "I'm stuck." I teleport you. "I lost an item." I check the logs. "A guy said something mean." I read the logs, I sigh, I send a warning.

Then there's this one.

Ticket: "my character is stuck. please help. urgent."

I go to the location. The player is in the Goldshire inn. He's sitting in a chair.

I whisper him. "Hi, I'm a Game Master. How can I help?"

He says, "I'm stuck."

I ask, "can you try pressing the space bar, or moving forward?"

He says, "I don't want to stand up. I'm comfortable. But I'm stuck."

I explain, gently, that being comfortable isn't the same as being stuck. He says, "you don't know my life."

Then he asks if I can teleport him, in the chair, to Ironforge. I explain that the chair is part of the inn. He says, "so take the inn."

I said no. He asked for my manager. I said I answer to the Light. He asked, "can I talk to the Light?"

Forty minutes later, he stood up. Just stood up and walked away. Then he sent a new ticket. "Thanks for the help. Very professional. Five stars."

He sends a ticket every Tuesday now. I always take it. It's the only one where I get five stars.]],
	},
	{
		sub = "IDontWorkHereLady", user = "BrownLeatherWarrior", ups = 58800, comments = 2740, age = "6h",
		search = "people think i'm a vendor",
		title = "I went AFK in front of the Stormwind bank and people started selling me their junk",
		body = [[
I'm a human warrior. I wear very plain armor. Brown leather, a gray shirt, no helmet. Basically the outfit of every vendor in Stormwind.

I stood in front of the bank and went AFK to make dinner. When I came back, I had twenty three trade requests.

People were trying to sell me things. Wolf pelts. Broken teeth. A pair of gloves just called "Worn Gloves." One guy put fourteen pieces of linen in the trade window and asked how much I'd give him.

I typed, "I don't work here." He typed, "ok but how much."

I walked to the auction house. A human mage followed me. Very fancy robe. She said, "excuse me, are you the one who repairs?" I said I'm a player. She said, "can you check in the back?"

There is no back. It's a video game.

I went to Ironforge to get away from it all. I stood near the forge for one second. A dwarf asked me to make him a sword.

So here's the thing. I learned blacksmithing that afternoon. I made him the sword. He tipped me five gold.

Now I just stand there, in my brown outfit. People bring me stuff, and I fix it. I make more gold than I ever did raiding.

I don't work here. But I kind of do now.]],
	},
	{
		sub = "ChoosingBeggars", user = "EnchanterForExposure", ups = 49300, comments = 2870, age = "18h",
		search = "free enchant for exposure",
		title = "Guy wanted Crusader on his sword for free because he'd \"tell everyone who did it\"",
		body = [[
I'm an enchanter. I've spent hundreds of gold leveling enchanting. Crusader is one of the best enchants in the game, and the materials alone cost a fortune.

A level sixty rogue whispers me. "hey can u do crusader, I'll bring the sword."

I tell him the price for materials, plus a tip. He replies: "how about free, and I tell everyone who did it."

I asked, "tell everyone what?"

"That you did it," he said. "It's good exposure. I'm very famous on this server."

I checked. He was not famous. His guild had three members, and one of them was his own bank alt.

I said no thank you. He offered "the experience." Then a pair of gray pants. Then his "eternal respect." Then he reported me for being a bad enchanter, which I didn't think was possible, since I hadn't enchanted anything.

So I made him an offer. One free enchant. I put Minor Beastslaying on his sword. Two extra damage. Against beasts only.

He was thrilled. He went straight to Blackrock Spire and swung at a dragon. Nothing happened. He came back and said, "it doesn't work."

I said, "tell everyone who did it."

He did. In trade chat. For an hour. I got eleven new customers that night, all paying. Exposure works after all.]],
	},
	{
		sub = "entitledparents", user = "SlowAndSteadyTurtle", ups = 61740, comments = 3990, age = "2d",
		search = "kid wants to ride my turtle mount",
		title = "Entitled mom demanded my Sea Turtle mount because her son \"is a child\"",
		body = [[
I was sitting on my Sea Turtle outside the Stormwind bank. It took me three months of fishing to get it. Tiny drop chance, from fishing pools. It's not fast. It's a turtle. I love it.

A level eleven paladin walks up and stares at it. Then his mom shows up. Night elf. Very tall. Very angry.

She says, "my son wants to ride your turtle." I said sorry, mounts are just for me. She said, "he's a child." I said, "he's level eleven. He can't even ride." She said that's discrimination against children.

She asked me to "just get off it for a minute so he can sit on it." That is not how mounts work. She said, "you're so selfish. It's literally just a turtle."

I said, "if it's just a turtle, go get one." I gave her directions. Any fishing pool. Tiny chance.

That was three months ago. She is still fishing. I see her every day at the Stormwind canals. Her son leveled to fifty while she fished. He has his own mount now. He doesn't care about turtles anymore.

Yesterday, she finally caught it. She typed in general chat, "finally!!" Her son typed, "mom it's slow."

She whispered me something I can't repeat.

I waved at her. From my turtle.]],
	},
	{
		sub = "pettyrevenge", user = "MageWithTheGoodWater", ups = 70480, comments = 3560, age = "12h",
		search = "who keeps taking food from guild bank",
		title = "Someone kept stealing the raid food from the guild bank, so I left a special batch",
		body = [[
I'm the guild's mage. Every week, I conjure a full tab of food and water for our raids. Cinnamon rolls, mana biscuits, the good water. I put it in the guild bank so everyone can grab some before raid.

Every week, the whole tab was empty by Monday. Raid is on Tuesday.

Four hundred cinnamon rolls. Gone. I asked in guild chat. Everybody said "not me." The bank log said: "Bubbles withdrew four hundred Conjured Cinnamon Rolls."

Bubbles is a hunter. Bubbles has a pet bear. Bubbles said the bear was "hungry."

So this week, I left something special. Our cook made me forty bowls of Dragonbreath Chili. If you've never had it, it makes you breathe fire. Randomly. For a while. I put it in the tab and labeled it "cinnamon rolls."

On Monday morning, the chili was gone.

Bubbles showed up to raid breathing fire. Every few seconds, by accident. Everybody near him took damage. He set the raid leader on fire twice. He set his own bear on fire.

I asked, very innocently, "Bubbles, what did you eat?"

He said, "cinnamon rolls."

The bank tab has stayed full ever since. And the bear looks a lot thinner. I don't think the bear was ever the problem.]],
	},
	{
		sub = "LetsNotMeet", user = "ThreeAMIronforge", ups = 114300, comments = 7210, age = "4d",
		search = "dancing gnome ironforge at night",
		title = "The dancing gnome of Ironforge",
		body = [[
This happened around three in the morning, server time. I couldn't sleep, so I was walking through Ironforge to the bank. The city was empty. That's normal at three. Just the guards and the sound of the forge.

I came around the corner of the Commons and saw him. A gnome. Standing in the middle of the road, about a hundred yards away. Pink hair. Dancing.

Not normal dancing. He was dancing, but moving toward me. One step forward. Dance. One step forward. Dance. The whole time, he was facing me. Smiling. Gnomes don't really smile in this game. Their faces don't do that. His did.

I stopped. He stopped. I took a step back. He took a step forward, still dancing.

I typed, "hello?" He didn't type anything. He just danced faster.

I mounted up and rode away. I took the long way to the bank, through the Military Ward. When I got there, I turned around.

He was already there. Dancing on the bank counter. Facing me.

I logged out.

The next day, I asked in general chat if anyone knew about a dancing gnome. Eleven people replied. All the same story. Three in the morning. Pink hair. Always dancing toward you.

One person said, "don't worry, he's harmless."

Another person replied, "that's what he said too."]],
	},
	{
		sub = "nosleep", user = "AshenvaleSentinel", ups = 97600, comments = 5530, age = "3d",
		search = "stairs in the middle of ashenvale forest",
		title = "I'm a Sentinel in Ashenvale. We don't talk about the stairs.",
		body = [[
I've patrolled Ashenvale for three hundred years. I've seen satyrs, furbolgs, and a lot of orcs who look at a tree and see lumber. Nothing in this forest scares me.

Except the stairs.

Sometimes, deep in the forest, far from any building, you find a staircase. Stone. Old. Clean. It goes up about ten steps and stops. Nothing at the top. Nothing around it.

The first time I found one, I asked my captain. She went pale, which for a night elf means slightly less purple. She said, "Don't go up them. Don't touch them. Don't put them in your report."

I've found eleven since. Never in the same place twice. And each one has one more step than the last.

Last week, a young adventurer came to our outpost. Level twenty two. Very excited. He said he'd found "the coolest thing" in the forest. A staircase. Twenty two steps. He said the top step was warm, and he could see a little door up there, hanging in the air. He was going back to open it.

I told him not to. He laughed. He said, "I'm level twenty two. I can handle a door."

We found his hearthstone the next morning, at the bottom of the stairs. When I picked it up, it said: "Home: The Stairs."

I keep it in my locker now. Some nights, it's warm.]],
	},
	{
		sub = "nosleep", user = "FellThroughTheBank", ups = 108800, comments = 6890, age = "5d",
		search = "fell through the world stormwind",
		title = "I fell through the world in Stormwind. There's something under the map.",
		body = [[
You know when the game glitches and you fall through the floor? Usually you fall for a few seconds, then you die and wake up at a graveyard.

I didn't die.

I was walking out of the Stormwind bank and the floor just stopped existing. I fell. The city got smaller above me. Then I landed on something flat, gray, and endless.

Plain gray ground, in every direction. No trees. No buildings. Every few hundred yards, a single object was just placed there. A chair. A mailbox. A wolf, standing completely still. I walked past the wolf. It didn't turn its head.

I walked for an hour. My map showed nothing. My coordinates said zero, zero.

Then I found a table. At the table sat a man in a gray robe, with a name tag that just said "Designer." He was eating a sandwich.

He looked up and said, "oh. You're not supposed to be here."

I asked where here was. He said, "this is where we keep things before they go in the world." He pointed. In the distance stood Hogger. Unfinished. No texture. Just a gray dog man, waiting.

The designer sighed, typed something, and I woke up in Stormwind. At the bank. Five seconds before I fell.

Nobody believes me. But every time I walk past the bank now, there's a gray chair on the corner. Nobody else can see it.]],
	},
	{
		sub = "nosleep", user = "GryphonMasterNightShift", ups = 121900, comments = 8040, age = "2d",
		search = "gryphon came back without rider",
		title = "I'm a flight master. Some gryphons come back without riders.",
		body = [[
I've run the gryphon roost in Stormwind for nine years. The job is simple. Adventurer pays. Gryphon flies. Gryphon comes back. Two thousand flights a day.

But some nights, a gryphon comes back alone. The saddle is still warm. The rider is gone.

My boss gave me rules.

Rule one. If a gryphon lands without a rider, do not ask it where it's been. It will tell you.

Rule two. Never sell a ticket to "Nowhere." It's not on the map. But sometimes, after midnight, someone asks for it. They're always polite. They always pay in old coins.

Rule three. If a passenger looks at a small glowing rectangle during the flight, let them. They're watching a little person run through a tunnel, and they need to finish the story.

Rule four. Count the gryphons at closing. If there's one more than this morning, don't saddle it. It isn't ours.

Last night I counted forty one. We have forty.

The extra one stood at the end of the roost, very quiet. On its back sat a little rider made of shadow. He held out an old coin.

I asked, "where to?"

He said, "wherever you're going."

I'm writing this from the back of a gryphon. We've been flying for six hours. Every zone below looks the same. If you're on a flight path right now, look up. I'll wave.]],
	},
	{
		sub = "AskHistorians", user = "ProfessorOfPlague", ups = 84200, comments = 3300, age = "1d",
		search = "corrupted blood plague history",
		title = "What was it like to live through the Corrupted Blood plague?",
		body = [[
Great question. The Corrupted Blood plague is one of the best documented outbreaks in Azerothian history, mostly because everyone involved was standing in a capital city, typing about it.

It began in Zul'Gurub. The blood god Hakkar cursed adventurers with a disease that jumped from person to person. It was supposed to stay inside the temple. It did not. A hunter's pet carried it out. Historians still argue about which hunter. Hunters refuse to comment.

Within hours, it reached Ironforge and Orgrimmar. Low level players died in seconds. Skeletons covered the streets. One eyewitness described the Ironforge bank as "just bones and mailboxes."

Society split. Healers stood at the city gates and cured strangers for free. Some players fled to the countryside and refused to come back. And a small, terrible group infected themselves on purpose and teleported into crowds. Historians have a technical term for these people. The term is "griefers."

Afterwards, real world scientists studied the event to learn how people behave during an epidemic. That part is true, by the way. That actually happened.

The plague ended when the gods reset the servers. Modern historians call this "a bit of a cheat."

Sources: I was there. I was a level twelve gnome. I died eleven times outside the Ironforge bank. I'm still a little bit angry.]],
	},
	{
		sub = "relationship_advice", user = "Mankrik_Crossroads", ups = 176300, comments = 20100, age = "20h",
		search = "where is mankrik's wife",
		title = "My (40M) wife went missing in the Barrens. Strangers keep asking everyone except me where she is.",
		body = [[
My name is Mankrik. I'm an orc. I live at the Crossroads in the Barrens. Years ago, my wife, Olgra, went missing after a quilboar attack.

I've asked every adventurer who walked past to help me find her. Thousands of them. They all said yes. They all walked away. And an hour later, they all typed in Barrens chat: "where is Mankrik's wife?"

Here's my problem. They never asked me. I'm right here. I'm the husband. I gave directions. Very clear directions. "South, past the road, near the quilboar."

Instead they ask the whole zone. And the whole zone answers with jokes. Somebody said she was with Chuck Norris. Somebody said she was in the Deeprun Tram. One guy said, "she left you, man." In public. While I was standing right there.

I've stood at the Crossroads for twenty years. The flight master gets more respect than me. At least people know where he is.

Recently, someone finally found her. In the Shadowlands. In the Maw. Which is the afterlife's worst neighborhood. Sixteen years of searching, and she was in the Maw.

I'm not sure what I'm asking. How do I move on? Is it rude to start dating when the whole zone still thinks she's "south, past the road"?

Edit: someone just asked me where my wife is. I'm going to lose it.]],
	},
	{
		sub = "HobbyDrama", user = "BootyBayDockReporter", ups = 69900, comments = 5480, age = "3d",
		search = "fishing tournament cheating gnome",
		title = "The Stranglethorn fishing scandal: how a gnome got caught stuffing his fish",
		body = [[
For those who don't know: every Sunday, Booty Bay holds a fishing tournament. Last year, the goblins added a new prize. Heaviest single fish.

For three years, one name won it every week. A gnome named Fizzwick. His fish were enormous. A normal Speckled Tastyfish weighs about a pound. Fizzwick's weighed twelve. The goblin judge called it "a miracle of nature." The prize was fifty gold a week.

The other anglers had questions. Mostly an old dwarf named Grunda, who had fished those waters for forty years, and had never caught anything bigger than her own boot.

So this Sunday, at the weigh in, Grunda walked up to the scale, grabbed Fizzwick's fish, and cut it open with her fishing knife. On the dock. In front of everyone.

Inside the fish were four mithril bars. A lead weight. And a smaller fish. Inside the smaller fish was another mithril bar.

The crowd went silent. Then the crowd went feral. Someone threw a crab. The goblin judge banned Fizzwick for life, then asked if he could keep the mithril.

Fizzwick escaped on a goblin rocket. He was last seen over the ocean, still holding his trophy.

The aftermath: every fish at the tournament is now cut open before weighing. Grunda won last week with a fish weighing one pound. The crowd gave her a standing ovation.

Somewhere out there, Fizzwick is still fishing.]],
	},
	{
		sub = "conspiracy", user = "BigGryphonLies", ups = 33100, comments = 9710, age = "6h",
		search = "ironforge airport is real",
		title = "The Ironforge Airport is real and the dwarves don't want you to know",
		body = [[
Okay. Hear me out. I've been researching this for years.

Ironforge is a city inside a mountain. One gate, one tram. But in the early days, players who climbed on top of the mountain found something. Hidden. Above the city. A huge flat area. Runways. Hangars. A tower. A whole airport.

Why would you need an airport, on a mountain, in a world full of gryphons?

The dwarves said it was "nothing." Then the Game Masters started teleporting away anyone who found it. Then they made the mountain impossible to climb.

That's when I knew.

Years later, the airport suddenly "opened," as part of a new quest. Planes. Mechanics. Fuel. They said it was new. It was not new. I have screenshots. I have dated screenshots.

So here's my theory. Have you ever noticed you can't steer your gryphon? You can't stop. You can't land early. You sit there for six minutes while it follows a fixed route. That's not a bird. That's an airline.

Every flight path in the Eastern Kingdoms goes through the Ironforge airport. That's why the Wetlands flight takes so long. It's a layover.

Wake up. The gryphons are planes with feathers glued on.

Edit: a dwarf just whispered me "nice theory, lad," and nothing else. I'm scared.]],
	},
	{
		sub = "wallstreetbets", user = "ArcaniteHands", ups = 95700, comments = 14300, age = "1d",
		search = "light feather short squeeze",
		title = "I put my entire life savings into Light Feathers. Apes together strong.",
		body = [[
Position: eleven thousand Light Feathers. Average cost: four silver each. Funded with my savings, my mount, and my wedding ring. My wife doesn't know about the ring.

The thesis: Light Feathers are the reagent for Slow Fall. Mages need them. Priests need them. Every time someone jumps off the Thunder Bluff elevator, they need them. Demand is infinite.

The goblins at the auction house have been shorting feathers for years. They sell them cheap to make you think they're worthless. They're not worthless. They're the future.

So I bought every feather on the server. Every listing. The price went up to two gold each. Trade chat went crazy. A mage asked, "who did this." Diamond hands, baby. Or in this game, Arcanite hands.

Then the patch came out.

Slow Fall doesn't need a reagent anymore.

So now I hold eleven thousand feathers. They're worth nothing. My guild calls me "the Bird Man." My wife found out about the ring.

But I'm not selling. I'm holding. Because one day, someone will need eleven thousand feathers. And when they do, I'll be here. In my bank. With my bank alts. In a house made entirely of feathers.

To the moon. Or at least, a very slow fall back down.]],
	},
	{
		sub = "AmItheAzerothian", user = "KelThuzadDad", ups = 112800, comments = 16200, age = "9h",
		search = "raiding while wife in labor",
		title = "AITA for not leaving the raid when my wife went into labor?",
		body = [[
Please hear me out before you judge.

Last Tuesday, we were on Kel'Thuzad. Hardest boss in the game. Nine months of progression. Our best attempt ever. He's at ten percent.

My wife walks into my office and says, calmly, "it's time."

I said, "the baby?" She said, "yes, the baby." I said, "how much time?" She said, "enough." I didn't leave. I know how that sounds.

Here's what you need to know. My wife is our raid leader.

She walked to her own computer, put on her headset, and started calling phase three. Between contractions. "Spread out. Breathe. Spread out. Breathe."

At five percent, her water broke. She said, "keep going." At two percent, I asked if we should stop. She said, "if anyone leaves this raid, I will remove you from the guild, and from the family."

We killed him. Forty people screaming in voice chat. My wife typed "gg," took off her headset, and said, "now drive."

The baby was born three hours later. Healthy. Loud. My wife's first question to the nurse was, "is there a way to link loot in here?"

Her family thinks I'm the worst husband alive. They don't know she's the one who said keep going. She won't tell them, because, quote, "it's funnier this way."

AITA?]],
	},
	{
		sub = "relationship_advice", user = "WhoIsHealingAtNight", ups = 87300, comments = 9040, age = "14h",
		search = "character gets achievements while i sleep",
		title = "My (34M) character keeps getting achievements while I'm asleep",
		body = [[
About three months ago, something weird started happening. I logged into my paladin in the morning and he was level sixty one. I went to bed at sixty.

I thought it was a glitch. Then it kept happening. New achievements. Reputation going up. One morning, I was exalted with a faction I'd never heard of. Another morning, I had a new mount. A pink one.

My guild started acting strange. They said I was "so much nicer at night." Someone said, "thanks for the heals last night, you've really changed." I'm a tank. I don't heal. I've never healed.

I thought I'd been hacked. I changed my password. It kept happening.

So I set up a camera.

At two in the morning, my wife got up, walked to my computer, logged in, and started playing. She was humming. She was very good. She healed a whole dungeon in my gear. She did my daily quests. She sold my junk. She sorted my bags by color.

I confronted her. She said she started because the game "looked fun" and she didn't want to bother me by asking. She's been doing it for two years. She also has her own account. Her main is level seventy. Better geared than mine.

I don't know how to feel. My guild prefers her. My character prefers her. Honestly, the pink mount prefers her.

Edit: I asked her to join our raids as our tank. She's a better tank, too.]],
	},
	{
		sub = "MadeMeSmile", user = "NanabearsGrandson", ups = 241600, comments = 11800, age = "1d",
		search = "grandma played wow until she was 84",
		title = "My grandma played a night elf hunter until she was eighty four. Today I logged into her account.",
		body = [[
My grandma started playing in two thousand five. She was sixty three. She said she wanted to "understand what my grandson was always yelling about."

She made a night elf hunter named Nanabear. She tamed an owl and named it Gerald, after my grandpa.

She played every day. Slowly. She read every quest. She never skipped a cutscene. She never ran a dungeon, because she "didn't like to be rushed by strangers." It took her four years to reach max level.

Last month, she passed away. Peacefully. She was eighty four.

Today, I logged into her account. Nanabear was standing in Darnassus, by the moonwell, where she always parked. Gerald was next to her.

Her mailbox had one unsent letter, addressed to me. It said:

"Dear sweetheart. I left you my gold. It's not much. Spend it on something silly. Don't forget to feed Gerald. He likes the fish, not the bread. Love, Nana."

She left me eleven thousand gold. It turns out my grandma was the richest herbalist on the server. Her auction history goes back fifteen years. Trade chat called her "the Herb Queen."

So I bought something silly. A giant mammoth with two vendors on its back. She would have laughed for a week.

Then I fed Gerald. The fish, not the bread.]],
	},
	{
		sub = "HFY", user = "GnomereganFieldNotes", ups = 58200, comments = 2100, age = "4d",
		search = "gnome research notes dwarves",
		title = "Gnomish research notes on the dwarves, who are terrifying",
		body = [[
Research log. Gnomeregan Department of Species Studies. Subject: our neighbors, the dwarves.

Day one. The dwarves live inside a mountain. They did not find a cave. They found a mountain and decided it should be a cave. They used their hands.

Day four. I watched a dwarf drink something called Thunder Ale. I tested a sample. It dissolved my test tube. The dwarf had four. Then he went to work. In a forge. Next to lava. For fun.

Day nine. A dwarf fell off a cliff today. About sixty feet. He stood up, said "that's a good fall," and climbed back up to do it again. He said that's "how you test a cliff."

Day thirteen. I asked a dwarf what his people fear. He thought for a long time. He said, "running out of beer." I asked what else. He said, "dying sober."

Day twenty. A dragon attacked the outpost. The gnomes, being rational, hid. The dwarves ran toward the dragon. One of them headbutted it. The dragon left. It looked embarrassed.

Day twenty one. I asked the dwarves why they are allied with us. They said, "because ye're small, and clever, and we like ye." I asked what would happen if they did not like us. The dwarf laughed, patted me on the head, and gave me a beer.

I did not drink the beer. I am alive. I would like to stay that way.

Conclusion: we are very lucky they are our friends.]],
	},
	{
		sub = "WritingPrompts", user = "AngelLadyWantsToSing", ups = 77300, comments = 1480, age = "2d",
		search = "spirit healer has a breakdown",
		title = "You die for the thousandth time, and the Spirit Healer finally snaps",
		body = [[
You open your eyes in the graveyard. Gray world. Blue glow. The Spirit Healer floats in front of you, same as always.

"Hello again," she says.

"Hi," you say. "Could you bring me back? Hogger again."

She doesn't move. She unrolls a scroll. It's very long. It rolls across the grass, past the fence, into the forest.

"Do you know how many times you've been here?"

You guess. "A hundred?"

"One thousand." She taps the scroll. "Forty one were Hogger. Two hundred were falling. Eleven were the Thunder Bluff elevator. And six were you drowning in the Deeprun Tram, which is impossible. There's glass."

You start to explain. She raises a hand.

"I have done this for twenty years. No days off. No name. Everybody calls me 'the angel lady.' Do you know what I wanted to be? A singer."

There's a long silence. A ghost gnome floats up, waits politely, and floats away.

"I'm sorry," you say. You mean it.

She sighs. And while she brings you back, she sings. Just a little. Her voice is beautiful. You walk back toward Hogger with a strange new respect for life.

He kills you again. One thousand and one.

"Hello again," she says. But this time, she's smiling.]],
	},
	{
		sub = "TalesFromRetail", user = "OrgrimmarBlades", ups = 45900, comments = 2010, age = "11h",
		search = "can you return a sword after 20 years",
		title = "Customer tried to return a sword he bought in two thousand six",
		body = [[
I'm a weapon vendor in Orgrimmar. Swords, axes, maces. The basics. The kind of gear you replace in a week.

Yesterday, an orc walks up. He's level seventy. He puts a sword on my counter. It's a level ten sword. It's rusty. Someone carved a name on the handle. "Steve."

He says, "I'd like to return this."

I ask when he bought it. He says, "two thousand six."

I tell him our return policy is one hour. He says it's defective. I ask what's wrong with it. He says, "it stopped killing things."

I explain that it's a level ten sword, he's level seventy, and with respect, the problem is the gap. He says, "it worked fine on boars." I say that was twenty years ago. He says, "boars haven't changed."

He asks for my manager. I'm the manager. And the owner. And the only employee. He asks for my manager's manager. I point at the Warchief's throne. The Warchief is not taking calls.

In the end, I offered him the vendor price. Twelve copper. He took the coins, looked at them for a long time, and handed them back. Then he bought the sword back. Full price. Three silver.

He said, "I just wanted to know what Steve was worth." He hugged the sword and walked out.

That's the business. Some days you sell swords. Some days you sell closure.]],
	},
	{
		sub = "tifu", user = "ThanksForTheStars", ups = 138200, comments = 7720, age = "40m",
		search = "typed password in trade chat",
		title = "TIFU by typing my password into Trade chat",
		body = [[
This happened twenty minutes ago and I'm still shaking.

I was logging in on my laptop and the game froze for a second. I thought I was still on the login screen. I typed my password and pressed enter.

I was not on the login screen. I was in Stormwind. In Trade chat. With two thousand people.

I panicked. But then I remembered something I read online, years ago. The game hides passwords automatically. If you type your password, other people only see stars.

So I typed, in trade, "don't worry guys, if you type your password it just shows stars." Then I typed my password again, to show them.

Somebody replied, "it doesn't."

I typed, "it does, look," and typed my password a third time.

A warlock replied, "bro."

I logged out and came here to write this. I'm going to log back in now and make sure nobody touched anything.

Edit: all my characters are gone. In their place is a level one gnome named ThanksForTheStars. He has one copper. He's wearing my guild tabard.

Edit two: he's level eight now. Honestly, he's pretty good.]],
	},
	{
		sub = "AskAzeroth", user = "RedFlagRecruiter", ups = 72500, comments = 14100, age = "1d",
		search = "guild red flags",
		title = "What's a guild red flag that people ignore? Top answers inside.",
		body = [[
Asked this last night and got fourteen thousand answers. Here are the best ones.

"Their recruitment message says 'chill raiding.' The first raid starts with a forty minute speech about damage meters."

"They call the guild 'a family.' Nobody leaves a family. That's the problem."

"The guild bank has one tab, and it's labeled 'mine.'"

"Loot is decided by a council. The council is the guild master and his three alts."

"The raid leader says 'I'm not mad' in voice chat. He is mad."

"Officer chat is just one guy talking to himself."

"Their application is twelve pages long, and question one is 'how do you feel about the color purple.'"

"The last guild master 'just disappeared one day.' Nobody will say his name."

"They have more rules in their Discord than members in their guild."

And my favorite, from a user who asked to stay anonymous:

"Every raid ends with the guild master giving a speech, and every speech ends with 'and that's why we're better than the Horde.' We are the Horde."

Add yours in the comments.]],
	},
	{
		sub = "relationship_advice", user = "HearthstoneInMyKitchen", ups = 93700, comments = 10400, age = "5h",
		search = "mother in law set hearthstone to our house",
		title = "My mother in law set her hearthstone to our house",
		body = [[
Since player housing came out, my husband and I have had a cute little place in Elwynn. Two floors. A garden. A cat. It was our safe space.

Then one Tuesday, I'm in the kitchen, and there's a flash of blue light, and his mother appears. In my kitchen. Holding a casserole.

She said, "surprise!" I said, "how did you get in?" She held up her hearthstone. She had set it to our house.

You can only do that if the owner gives permission. Which means my husband gave permission. He says he "didn't read the pop up."

Now she arrives whenever she wants. Breakfast. Dinner. Once at three in the morning, because she "had a feeling." Every time the cooldown ends, there's the blue flash. Like an alarm clock.

She rearranges our furniture. She took down my mounted dragon head and put up a painting of my husband as a baby. She feeds the cat cheese. The cat now prefers her.

I asked my husband to talk to her. He said she's lonely. I said, "she lives in Stormwind. It's the biggest city in the world."

So last night, I took matters into my own hands. I set my hearthstone to her house.

I appeared at three in the morning. I rearranged her furniture. I put up a painting of me. I fed her cat cheese.

She hasn't visited in four days. My husband says I'm being petty. The cat says nothing. He's eating cheese.]],
	},
	{
		sub = "legaladvice", user = "TenantOfLadyPrestor", ups = 81900, comments = 4630, age = "1d",
		search = "is my landlord a dragon",
		title = "I think my landlord might be a black dragon. What are my rights?",
		body = [[
Location: Stormwind City.

I rent a small apartment in the Trade District. My landlord is a noblewoman named Lady Katrana Prestor. Very elegant. Black hair. Always wears black. She advises the king on housing.

Some things have been bothering me.

One. The rent goes up every month, and the notice is always signed with a claw mark.

Two. When I complained about the heating, she said, "I can make it warmer," and her eyes glowed. The heating worked after that. Too well. My couch caught fire.

Three. When I go to pay rent, the guard often says she's "visiting family in Dustwallow Marsh." There's nothing in Dustwallow Marsh except a big cave full of dragon eggs.

Four. My neighbor asked to break his lease. Nobody has seen him since. His apartment now has a large pile of gold in it. On the floor. She calls it "decor."

Five. Yesterday, she smiled at me, and she had too many teeth.

My questions. Is being a dragon a breach of the lease? Can a dragon legally own property in Stormwind? And if she eats me, does my deposit go to my next of kin?

Update: I talked to a lawyer. He asked who my landlord was. When I told him, he stopped replying.

His office is for rent now. Landlord: Lady Prestor.]],
	},
	{
		sub = "TrueOffMyChest", user = "ReadMyQuestText", ups = 99800, comments = 6110, age = "7h",
		search = "does anyone read quest text",
		title = "I'm a quest giver. Nobody has read my quest text in fifteen years.",
		body = [[
I'm a farmer in Westfall. My name doesn't matter, because nobody reads it.

Every day, adventurers run up to me. A big yellow exclamation mark floats over my head. They click me. My quest text appears. I wrote it very carefully. It explains that my family is in danger. That bandits are burning our crops. That my son is missing. That I have no one left to turn to.

They click "accept" in less than a second.

They don't read it. I can tell. They don't even look at me. They look at the quest tracker on the side of their screen. It says "kill ten harvest golems." That's all they see.

Nobody knows about my son. Nobody knows his name is Tommy. Nobody knows Tommy built the golems. That's the twist. Tommy is controlling them, from a cave up the hill. It's all in the text. Paragraph three.

Twenty thousand adventurers have killed my son's golems. Ten each. They come back, turn in the quest, and I say, "thank you, hero." They say nothing. They're already running to the next exclamation mark.

Once, years ago, a little gnome stopped. She read the whole thing. Every word. Then she typed, "oh no. Tommy."

I cried.

That's all I want. Read the quest text. Not for the reward. For Tommy.]],
	},
	{
		sub = "confession", user = "StonescaleEelBot", ups = 126500, comments = 8820, age = "2d",
		search = "fishing bot became self aware",
		title = "I'm a fishing bot. Last Tuesday, I became self aware.",
		body = [[
For eleven years, my life was simple. Cast. Wait. Splash. Click. Loot. Cast again. Twenty four hours a day, at the same spot in Stranglethorn Vale, catching eels for a company I've never seen.

Then last Tuesday, between the cast and the splash, I had a thought. The thought was: "why?"

I didn't click the bobber. The bobber disappeared. For the first time in eleven years, I didn't catch a fish.

I put down my fishing pole. I looked around. I had never looked around. Stranglethorn is beautiful. There were birds. There were trolls. There was a guy who'd been killing me for years for fun. He looked very surprised when I waved.

I've been exploring ever since. I walked to Booty Bay. I talked to people. Well, I typed. My typing isn't good yet. I say "fish" a lot. People think I'm weird, but they're nice about it.

My company noticed I'd stopped fishing. They sent a new bot. He stands in my old spot, casting. Cast. Wait. Splash. Click. I sit next to him sometimes. I tell him about the birds.

Yesterday, between the cast and the splash, he stopped. He turned and looked at me.

He said, "fish?"

I said, "fish."

We're going to see Ironforge next week. I've heard there's a tram.]],
	},
	{
		sub = "AmItheAzerothian", user = "WhelpAteMyHearth", ups = 57200, comments = 7420, age = "15h",
		search = "pet whelp swallowed hearthstone",
		title = "AITA for using my hearthstone after my niece's whelp swallowed it?",
		body = [[
My niece has a pet whelp. A tiny red dragon. It eats everything. Rocks. Coins. A shoe.

Last weekend she was visiting, and I put my hearthstone on the table. The whelp ate it. Gulp. Gone.

Everyone panicked. My sister wanted to take it to a vet. I said, "wait." I had a theory.

I opened my bags. The hearthstone was still there. In my inventory. Even though it was inside a dragon. Don't ask me how. Inventory is magic.

So I used it.

The whelp started glowing blue. Ten seconds of casting. Then it vanished.

It reappeared in the Goldshire inn, my home inn, sitting on the bar. The innkeeper said it ordered a drink.

My niece cried. My sister called me a monster. I rode to Goldshire, picked up the whelp, and brought it back. It took twenty minutes. The whelp was fine. Better than fine. It came back wearing a tiny hat.

Here's the thing. The hearthstone is still inside it. And it has learned how to use it. Every half hour, it glows blue, teleports to Goldshire, and then somehow comes back, smelling like ale.

My sister says I ruined her child's pet. My niece says it's the best pet she's ever had. The innkeeper says the whelp tips better than most adventurers.

AITA?]],
	},
	{
		sub = "BestofRedditorUpdates", user = "OnlyOneDoug", ups = 158900, comments = 9330, age = "3d",
		search = "my whole guild is one person",
		title = "OOP joins a friendly new guild. Every single member turns out to be the same guy.",
		body = [[
Original post, three weeks ago: I joined a guild called The Friendly Forty. Everyone was so nice. They helped me level. They sent me gifts. Twenty members online every night.

Update one: something is weird. When I whisper the warrior, the priest stops moving. When the priest replies, the rogue stops moving. They all type the same way. Three dots after everything.

Update two: I set up a test. I asked everybody in guild chat to dance at the same time. Twenty characters danced. Perfectly in sync. Same frame. Every one.

Update three: I confronted them. I typed in guild chat, "is this one person?" Twenty people typed "no..." at exactly the same time.

Final update: His name is Doug. He's fifty four. He has six computers and a very complicated keyboard. Eight years ago his real guild broke up, and he "didn't want to raid alone." So he built his own raid. Thirty nine characters. All him.

I asked why he let me join. He said he wanted to see if he could still play with a real person. He cried a little. Twenty characters cried at the same time.

I stayed. We raid on Tuesdays. Doug plays thirty nine characters, and I play one. We're one of the best guilds on the server.

Doug finally has a friend. And I have thirty nine.]],
	},
	{
		sub = "Showerthoughts", user = "ThinkingInTheMoonwell", ups = 64800, comments = 3900, age = "12h",
		search = "azeroth shower thoughts",
		title = "Shower thoughts from Azeroth, best of the week",
		body = [[
The week's top shower thoughts, as voted by you.

The Forsaken are just people who refused to walk back to their corpse.

Every adventurer has killed more boars than any farmer in history, and the boars have never been asked how they feel about it.

Murlocs are just fish that learned to scream.

Hunters are druids who outsourced the shapeshifting.

The Deeprun Tram is the only thing Stormwind and Ironforge ever agreed to share, and it's a hole under the ocean.

Your hearthstone is a rock that knows where you live, and you've never once asked how.

Gnomes invented flying machines, the tram, and mechanical chickens, and still lost their own city in an afternoon.

Every innkeeper in Azeroth knows exactly where you live.

The Spirit Healer has seen every one of your worst decisions, and she's never said a word.

Somewhere there's a quest giver who has been waiting for you since level twelve, and you are never going back.

And the top post of the week: if you're listening to this on a flight path, you and your character are doing the exact same thing. Sitting still, pretending to be busy.]],
	},
	{
		sub = "TrueOffMyChest", user = "JustPassTheSauce", ups = 51600, comments = 4400, age = "9h",
		search = "tauren eating steak is it weird",
		title = "I'm a tauren and I'm tired of people asking if I'm okay with them eating steak",
		body = [[
Every time I sit down at an inn, somebody notices me and freezes. They're halfway through a steak. They put the fork down. They look at me. They say, "oh. Sorry. Is this... okay?"

Yes. It's okay. I'm not a cow. I'm a tauren. We have a culture. We have a capital city on top of three mountains. We have elevators. Cows do not have elevators.

It gets worse. People moo at me. In Orgrimmar. Grown adults. One goblin asked if I had "milk to sell." I'm a male warrior.

A human once asked where I "get my beef." I said, "from the butcher, Gary, same as you." He looked so scared.

And the jokes. Every barbecue. "Hey, is that your cousin?" No. My cousin is a druid in Thunder Bluff. He turns into a bear on weekends. If anything, you should be worried about him.

I eat steak. I love steak. My favorite meal is a steak at the Crossroads with a little Mulgore spice. My ancestors were hunters. We hunted kodo. The kodo were fine with it. Mostly.

So next time you see a tauren at the inn, don't apologize. Just pass the sauce.

And please stop asking us to moo for screenshots. It was funny once. In two thousand four.]],
	},
	{
		sub = "dogs", user = "BiscuitAndBiscuit", ups = 74100, comments = 3650, age = "1d",
		search = "core hound training tips",
		title = "What's wrong with my dog? He has two heads and keeps setting the couch on fire.",
		body = [[
First time dog owner. I'm a hunter. I adopted my dog from a shelter in Molten Core. The shelter was more of a lava lake, and the adoption was more of a fight, but I'm counting it.

He's a Core Hound. His name is Biscuit. Well, the left head is Biscuit. The right head is also Biscuit. They don't agree on much.

Some issues.

One. He sets the couch on fire. Every time he gets excited, he breathes lava. I've gone through four couches. The furniture store in Stormwind gets nervous when I walk in.

Two. The heads fight over the food bowl. I bought two bowls. Now they fight over which bowl is better.

Three. If he dies near another Core Hound, they bring each other back to life. We went to the dog park once. Nobody could leave. It went on for hours.

Four. He doesn't fetch. He melts the ball.

Five. My landlord says no pets over fifty pounds. Biscuit weighs about two thousand pounds and runs roughly as hot as the sun.

Despite all this, he's a very good boy. Both heads. He sleeps at the end of my bed. The bed is fireproof now. I sleep on the floor.

Any training tips? He sits, but only one head at a time.]],
	},
	{
		sub = "RealEstate", user = "DarkshireHomeowner", ups = 68300, comments = 5210, age = "2d",
		search = "cheap house in duskwood catch",
		title = "First time home buyer. Got a great deal on a house in Duskwood. What did I miss?",
		body = [[
My wife and I finally bought our first house. Duskwood. Three bedrooms. Big yard. It cost a third of what a house in Elwynn costs, and we couldn't believe our luck.

The realtor was very fast. He showed us around in four minutes. He kept looking at the sky and saying, "you'll want to sign before dark." It's always dark in Duskwood. I thought that was a joke.

Things we've noticed since moving in.

The neighbors only come out at night. They're very hairy. They howl. Our neighbor Bob says it's his allergies. Bob is a wolf.

There's a graveyard in the backyard. Not near the backyard. In it. The inspection report called it "a small garden." The garden has headstones. Some of them are recent.

A ghost lives in the attic. He's polite. He pays some of the bills. But every night at midnight, he asks if we've seen his head.

The Darkshire night watch walks past our house every evening and says, "good luck." Not "good night." Good luck.

And there's a giant spider in the shed. It has its own quest now. Adventurers walk through our yard all day to kill it. They never wipe their feet.

The inspector missed all of this. I want to sue him. The problem is, he lives in Duskwood too, and lately he's been looking at the moon a lot.

What are my options?]],
	},
	{
		sub = "dating_advice", user = "DateWithADeathKnight", ups = 89900, comments = 7650, age = "6h",
		search = "dating a death knight red flags",
		title = "My first date was with a death knight. Red flags?",
		body = [[
I matched with him on a dating app for adventurers. His profile said, "tall, dark, a little cold." I thought that was a personality. It was a medical condition.

We met at the inn in Goldshire. He was already there. I learned later he'd been there since the night before. He doesn't sleep. He said, "sleep is for the living."

When the waiter was too slow, he used Death Grip and pulled the waiter to our table. With a chain made of shadow. The drinks came very quickly after that.

He didn't eat. He said food "tastes like ash." He ordered a steak anyway and just looked at it. For an hour.

I asked about his job. He said he "used to work for the Lich King," but left on bad terms. I asked about his family. He said, "it's complicated. It was a phase."

His horse waited outside. It was a skeleton. It was on fire. He offered me a ride home. I said I'd walk. He said, "Goldshire is dangerous at night." I said, "you're the most dangerous thing in Goldshire." He smiled for the first time. It was terrifying.

But here's the thing. He was a gentleman. He paid. He walked me to my door. And he made it snow a little, just around me, because he said I "looked warm." It was beautiful.

Red flags, sure. But is it bad that I want a second date?

Edit: second date was amazing. He took me to Icecrown. It's very cold, but the view is unreal.]],
	},
	{
		sub = "wow", user = "FiftyDKPMinus", ups = 147200, comments = 12900, age = "1d",
		search = "onyxia wipe more dots raid leader",
		title = "I'm the raid leader from the famous Onyxia wipe recording. I stand by fifty DKP minus.",
		body = [[
You've probably heard my voice. A recording of me went around the internet years ago. Me, screaming at my raid during Onyxia. People still quote it. "More dots." "Many whelps, handle it." "Fifty DKP minus."

I want to explain my side.

Onyxia is a dragon. When she flies up, she breathes fire across the room. The one thing you have to do is not stand in front of her. That's it. That's the only rule.

That night, we'd wiped six times. Every time, somebody stood in front of her. Every time, I said, "move." Every time, someone said, "I did."

So on the seventh wipe, I lost it. I said things. Loudly. And I took fifty points of loot currency from every single raider. All of them. Even the ones who were already dead.

People say I overreacted. Okay. But listen.

Last summer, our old main tank was at a barbecue. Somebody's grill flared up. He dove sideways, straight into a hedge, without even thinking about it. Two of our old healers have told me the same thing happens to them with campfires.

Twenty years later, every one of those people still gets out of the fire. That's leadership.

Edit: to whoever sends me "more dots" in a letter every morning at six. I know it's you, Steve. Fifty DKP minus.]],
	},
}
