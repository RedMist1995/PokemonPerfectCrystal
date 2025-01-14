SAFARI_ZONE_PRICE EQU 500

	object_const_def ; object_event constants
	const SAFARIZONEGATE_OFFICER_LEFT
	const SAFARIZONEGATE_OFFICER_RIGHT

SafariZoneFuchsiaGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SAFARI_ZONE_NOTHING
	scene_script .DummyScene1 ; SCENE_SAFARI_ZONE_REENTER
	scene_script .LeaveSafariEarly ; SCENE_SAFARI_ZONE_LEAVE_EARLY

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfSafariRunning

.DummyScene0:
	end

.DummyScene1:
	end

.CheckIfSafariRunning
	checkflag ENGINE_SAFARI_ZONE_TIMER
	iftrue .SafariIsRunning
	setscene SCENE_SAFARI_ZONE_NOTHING
	return

.SafariIsRunning:
	setscene SCENE_SAFARI_ZONE_LEAVE_EARLY
	return

.LeaveSafariEarly:
	checkflag ENGINE_SAFARI_ZONE_TIMER
	iftrue .LeavingSafariEarly
	end

.LeavingSafariEarly
	opentext
	writetext SafariZoneEntranceLeavingEarly
	yesorno
	iffalse .GoBackToSafari
	writetext SafariZoneEntranceReturnBalls
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	sjump Leave
	clearevent EVENT_IN_SAFARI_ZONE
	return

.GoBackToSafari
	step UP
	step_end
	warpfacing UP, SAFARI_ZONE_CENTER, 14, 23
	return

WalkUpToOfficerEvent:
	checkevent EVENT_IN_SAFARI_ZONE
	iftrue OfficerScript
	applymovement PLAYER, .WalkToOfficer
	checkevent EVENT_VISITED_SAFARI_ZONE
	iftrue VisitText
	sjump  FirstTimeText
	end

.WalkToOfficer:
	step UP
	step UP
	turn_head LEFT
	step_end

FirstTimeText:
	opentext
	writetext SafariZoneEntranceFirstTime
	waitbutton
	writetext SafariZoneEntranceExplanation
	setevent EVENT_VISITED_SAFARI_ZONE
	closetext
	sjump VisitText
	end

VisitText:
	sjump .SafariGate_PayForSafariZone
	end

.SafariGate_PayForSafariZone:
	opentext
	writetext SafariZoneEntranceWelcome
	closetext
	opentext
	writetext SafariZoneEntranceCost
	special PlaceMoneyTopRight 
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, SAFARI_ZONE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, SAFARI_ZONE_PRICE
	special PlaceMoneyTopRight 
	writetext SafariZoneEntrancePayment
	waitbutton
	setflag ENGINE_SAFARI_ZONE_TIMER
	special GiveSafariBalls
	waitsfx
	playsound SFX_GOT_SAFARI_BALLS
	waitbutton
	writetext SafariZoneEntranceCallYou
	waitbutton
	closetext
	applymovement PLAYER, Enter1
	setevent EVENT_IN_SAFARI_ZONE
	special FadeOutPalettes
	waitsfx
	warpfacing UP, SAFARI_ZONE_CENTER, 14, 23
	end

.Refused
	opentext
	writetext SafariZoneEntranceLeave
	waitbutton
	closetext
	applymovement PLAYER, Cancel
	end

.NotEnoughMoney:
	writetext SafariZoneEntranceNotEnoughMoney
	waitbutton
	closetext
	applymovement PLAYER, Cancel
	end

Enter1:
	step UP
	step UP
	step UP
	step UP
	step_end

Cancel:
	step DOWN
	step_end

Leave:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	setscene SCENE_SAFARI_ZONE_REENTER
	step_end

OfficerScript:
	end

SafariZoneEntranceWelcome:
	text "Welcome to the"
	line "SAFARI ZONE!"
	done

SafariZoneEntranceCost:
	text "For just ¥500,"
	line "you can catch all"
	
	para "the #MON you"
	line "want in the park!"

	para "Would you like to"
	line "join the hunt?"
	done

SafariZoneEntrancePayment:
	text "That'll be ¥500"
	line "please!"

	para "We only use a"
	line "special # BALL"
	cont "here."

	para "<PLAYER> received"
	line "30 SAFARI BALLs!"
	done

SafariZoneEntranceCallYou:
	text "We'll call you on"
	line "the PA when you"
	
	para "run out of time"
	line "or SAFARI BALLs!"
	done

SafariZoneEntranceLeave:
	text "OK! Please come"
	line "again!"
	done

SafariZoneEntranceNotEnoughMoney:
	text "Oops! Not enough"
	line "money!"
	done

SafariZoneEntranceLeavingEarly:
	text "Leaving early?"
	done

SafariZoneEntranceReturnBalls:
	text "Please return any"
	line "SAFARI BALLs you"
	
	para "have left."
	done

SafariZoneEntranceGoodLuck:
	text "Good Luck!"
	done

SafariZoneEntranceComeAgain:
	text "Did you get a"
	line "good haul?"
	
	para "Come again!"
	done

SafariZoneEntranceFirstTime:
	text "Hi! Is it your"
	line "first time here?"
	done

SafariZoneEntranceExplanation:
	text "The SAFARI ZONE "
	line "has 4 zones in it."

	para "Each zone has"
	line "different kinds"
	cont "of #MON. Use"
	cont "SAFARI BALLs to"
	cont "catch them!"

	para "When you run out"
	line "of time or SAFARI"
	cont "BALLs, it's game"
	cont "over for you!"

	para "Before you go,"
	line "open an unused"
	cont "#MON BOX so"
	cont "there's room for"
	cont "new #MON!"
	done

SafariZoneEntranceRegular:
	text "Sorry, you're a"
	line "regular here!"
	done

SafariZoneFuchsiaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  0, SAFARI_ZONE_CENTER, 1
	warp_event  3,  0, SAFARI_ZONE_CENTER, 2
	warp_event  2,  7, FUCHSIA_CITY, 7
	warp_event  3,  7, FUCHSIA_CITY, 7

	db 2 ; coord events
	coord_event  2,  5, SCENE_SAFARI_ZONE_REENTER, VisitText
	coord_event  3,  5, SCENE_SAFARI_ZONE_REENTER, VisitText
	;coord_event  2,  1, SCENE_DEFAULT, LeaveSafariEarly
	;coord_event  3,  1, SCENE_DEFAULT, LeaveSafariEarly

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  5, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OfficerScript, -1
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OfficerScript, -1
