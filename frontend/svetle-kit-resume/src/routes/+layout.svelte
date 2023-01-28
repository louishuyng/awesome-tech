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
		margin-top: 3rem;
	}

	main {
		flex: 1;
		display: flex;
		margin-top: 2rem;
		margin-left: 2rem;
		margin-right: 2rem;
	}
</style>
