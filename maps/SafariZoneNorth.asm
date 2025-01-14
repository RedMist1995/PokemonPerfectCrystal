SafariZoneNorth_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneNorth_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  2, 27, SAFARI_ZONE_WEST, 1
	warp_event  3, 27, SAFARI_ZONE_WEST, 2
	warp_event 12, 27, SAFARI_ZONE_CENTER, 1
	warp_event 13, 27, SAFARI_ZONE_CENTER, 2
	warp_event 29, 22, SAFARI_ZONE_EAST, 1
	warp_event 29, 23, SAFARI_ZONE_EAST, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
