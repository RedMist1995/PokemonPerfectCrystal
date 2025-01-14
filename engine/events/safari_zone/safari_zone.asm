GiveSafariBalls:
	xor a
	ld [wSafariMon], a
	ld a, 20
	ld [wSafariBallsRemaining], a
	farcall StartSafariZoneTimer
	ret

SafariZoneBattleScript::
	loadvar VAR_BATTLETYPE, BATTLETYPE_SAFARI
	randomwildmon
	startbattle
	reloadmapafterbattle
	readmem wSafariBallsRemaining
	iffalse SafariZoneOutOfBallsScript
	end

SafariZoneOverScript::
	playsound SFX_ELEVATOR_END
	opentext
	writetext SafariZoneText_BeeepTimesUp
	waitbutton
	sjump SafariZoneReturnToGateScript

SafariZoneOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext SafariZoneText_HuntIsOver
	waitbutton

SafariZoneReturnToGateScript:
	closetext
	jumpstd safarizoneresultswarp

SafariZoneText_BeeepTimesUp:
	; ANNOUNCER: BEEEP! Time's up!
	text_far SafariZoneContestTimesUpString
	text_end

SafariZoneText_HuntIsOver:
	; ANNOUNCER: The hunt is over!
	text_far SafariZoneTheHuntsOverString
	text_end
