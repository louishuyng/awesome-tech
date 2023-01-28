<script>
	/**
	 * @type {string}
	 */
	export let companyName;

	/**
	 * @type {string}
	 */
	export let companyLink;

	/**
	 * @type {string}
	 */
	export let position;

	/**
	 * @type {string}
	 */
	export let label;

	/**
	 * @type {string}
	 */
	export let timeLine;

	/**
	 * @type {Array<string>}
	 */
	export let companyInfo;

	/**
	 * @type {Array<string>}
	 */
	export let dailyWork;
</script>

<div>
	<div class="section">
		<h2 style="margin-bottom: 0px">{timeLine}</h2>
	</div>
	<h3>{companyName}</h3>
	<span class="label">{label}</span>
	<ul>
		<li>
			<span class="function">company_info()</span>
			<span class="arrow">=></span>
			<div class="return_quote">
				{#each companyInfo as info}
					<div>{info}</div>
				{/each}
				<a href={companyLink} target="_blank" rel="noreferrer">More Detail</a>
			</div>
		</li>
	</ul>
	<ul>
		<li>
			<span class="function">position()</span>
			<span class="arrow">=></span>
			<span class="return_value">{position}</span>
		</li>
	</ul>
	<ul>
		<li>
			<span class="function">daily_work()</span>
			<span class="arrow">=></span>
			<div class="return_quote">
				<div />
				<div />
				<div />

				{#each dailyWork as work}
					<div>{work}</div>
				{/each}
			</div>
		</li>
	</ul>
</div>
