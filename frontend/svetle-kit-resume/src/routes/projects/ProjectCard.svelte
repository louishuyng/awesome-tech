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
	<h3 style="margin-bottom: 0px">{timeLine}</h3>
	<div style="display: flex; align-items: center">
		<h4>{companyName}</h4>
		<span class="label" style="margin-left: 0.7rem">{label}</span>
	</div>
	<ul style="margin-top: 0">
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
