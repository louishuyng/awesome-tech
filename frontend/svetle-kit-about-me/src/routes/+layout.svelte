<script>
	import Navigation from './Navigation.svelte';
	import './styles.css';
</script>

<div class="app">
	<Navigation />
	<main>
		<slot />
	</main>
</div>

<style>
	.app {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		margin-top: 7rem;
		margin-left: 5rem;
	}

	main {
		flex: 1;
		display: flex;
		margin-top: 3rem;
	}
</style>
