
SeafoamEntrance_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

SeafoamEntrance_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, ROUTE_20, 1
	warp_event  7,  5, SEAFOAM_GYM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	