SafariZoneEast_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneEast_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0, 14, SAFARI_ZONE_CENTER, 5
	warp_event  0,  4, SAFARI_ZONE_NORTH, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
