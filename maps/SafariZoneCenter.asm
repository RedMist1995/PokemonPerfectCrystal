SafariZoneCenter_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneCenter_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 14, 23, SAFARI_ZONE_FUCHSIA_GATE, 1
	warp_event 15, 23, SAFARI_ZONE_FUCHSIA_GATE, 2
	warp_event 29,  8, SAFARI_ZONE_EAST,         3
	warp_event 29,  9, SAFARI_ZONE_EAST,         4
	warp_event 16,  0, SAFARI_ZONE_NORTH,        3
	warp_event 17,  0, SAFARI_ZONE_NORTH,        4
	warp_event  0,  6, SAFARI_ZONE_WEST,         3
	warp_event  0,  7, SAFARI_ZONE_WEST,         4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
