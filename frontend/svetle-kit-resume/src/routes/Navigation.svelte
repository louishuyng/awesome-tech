<script>
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { page } from '$app/stores';

	/**
	 * @type {string | URL | null}
	 */
	let currentSpace = null;
	/**
	 * @type {string}
	 */

	/**
	 * @param {string} space
	 */
	function onClick(space) {
		currentSpace = space;
		goto(space);
	}

	onMount(() => {
		page.subscribe((page) => {
			currentSpace = page.url.pathname.split('/')[1] || 'about-me';
			goto(currentSpace);
		});
	});
</script>

<div class="navigation">
	<button
		style="margin-right: 15px; cursor: pointer;"
		on:click={() => onClick('about-me')}
		class:active={currentSpace == 'about-me'}>About me</button
	>
	<button
		style="margin-right: 15px; cursor: pointer;"
		on:click={() => onClick('projects')}
		class:active={currentSpace == 'projects'}>Projects</button
	>
	<button
		style="margin-right: 15px; cursor: pointer;"
		on:click={() => onClick('contacts')}
		class:active={currentSpace == 'contacts'}>Contacts</button
	>
</div>

<style>
	.navigation {
		display: flex;
		flex-direction: row;
		margin-left: 1rem;
	}

	.active {
		font-weight: bold;
		color: #c678dd;
	}
</style>
