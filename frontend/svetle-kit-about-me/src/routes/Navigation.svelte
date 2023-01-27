<script>
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	/**
	 * @type {string}
	 */
	let currentSpace = 'about-me';

	/**
	 * @param {string} space
	 */
	function onClick(space) {
		currentSpace = space;
		goto(space);
	}

	onMount(() => {
		goto(currentSpace);
	});
</script>

<div class="navigation">
	<button
		style="margin-right: 15px"
		on:focus={() => onClick('about-me')}
		class:active={currentSpace == 'about-me'}>About me</button
	>
	<button
		style="margin-right: 15px"
		on:focus={() => onClick('projects')}
		class:active={currentSpace == 'projects'}>Projects</button
	>
	<button
		style="margin-right: 15px"
		on:focus={() => onClick('contacts')}
		class:active={currentSpace == 'contacts'}>Contacts</button
	>
</div>

<style>
	.navigation {
		display: flex;
		flex-direction: row;
	}

	.active {
		font-weight: bold;
		color: #c678dd;
	}
</style>
