; Eric Chun - jc2ppp - 11/5/20 - binarySearch.s

	global binarySearch
	section .text

; Parameter 1 (edi): pointer to int array
; Parameter 2 (esi): integer, beginning of the array
; Parameter 3 (edx): integer, end of the array
; Parameter 4 (ecx): integer, target to find in array
; return (eax): integer, index of target in array or -1 if it wasn't found

binarySearch:	
	lea r10d, [esi + edx]	; r10d = (esi + edx) / 2, middle index
	shr r10d, 1

	cmp ecx, [edi + 4*r10d]
	je binarySearchEnd	; if ecx == a[r10d], jump to binarySearchEnd
	jg binarySearchGreater	; if ecx > a[r10d], jump to binarySearchGreater
	jl binarySearchLess	; if ecx > a[r10d], jump to binarySearchLess
binarySearchGreater:
	cmp esi, edx		; if esi == edx, jump to binarySearchOne
	je binarySearchOne
	
	lea esi, [r10d + 1]	; call binarySearch on right half of array
	call binarySearch
	ret
binarySearchLess:
	cmp esi, edx		; if esi == edx, jump to binarySearchOne
	je binarySearchOne
	
	lea edx, [r10d - 1]	; call binary search on left half of array
	call binarySearch
	ret
binarySearchOne:
	mov eax, -1
	ret
binarySearchEnd:
	mov eax, r10d		; return the index where the target was found
	ret
