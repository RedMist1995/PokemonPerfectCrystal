SafariZoneDropOffMons:
	ld hl, wPartyMon1HP
	ld a, [hli]
	or [hl]
	jr z, .fainted
; Mask the rest of your party by setting the count to 1...
	ld hl, wPartyCount
	ld a, 1
	ld [hli], a
	inc hl
; ... backing up the second mon index somewhere...
	ld a, [hl]
	ld [wSafariZoneFirstPartySpecies], a
; ... and replacing it with the terminator byte
	ld [hl], -1
	xor a
	ld [wScriptVar], a
	ret

.fainted
	ld a, $1
	ld [wScriptVar], a
	ret

SafariZoneReturnMons:
; Restore the species of the second mon.
	ld hl, wPartySpecies + 1
	ld a, [wSafariZoneFirstPartySpecies]
	ld [hl], a
; Restore the party count, which must be recomputed.
	ld b, 1
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	inc b
	jr .loop

.done
	ld a, b
	ld [wPartyCount], a
	ret
