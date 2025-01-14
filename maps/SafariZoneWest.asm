SafariZoneWest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneWest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 16,  0, SAFARI_ZONE_NORTH, 1
	warp_event 17,  0, SAFARI_ZONE_NORTH, 2
	warp_event 23, 16, SAFARI_ZONE_CENTER, 3
	warp_event 23, 17, SAFARI_ZONE_CENTER, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
