<svelte:head>
	<title>About</title>
	<meta name="description" content="About Me" />
</svelte:head>
<div class="wrapper">
	<div class="section"><h2>I. Info</h2></div>
	<ul>
		<li>
			<span class="function">name()</span>
			<span class="arrow">=></span>
			<span class="return_value">Huy Nguyễn</span>
		</li>
		<li>
			<span class="function">gender()</span>
			<span class="arrow">=></span>
			<span class="return_value">Male</span>
		</li>
		<li>
			<span class="function">birth_year()</span>
			<span class="arrow">=></span>
			<span class="return_value">1996</span>
		</li>
		<li>
			<span class="function">locates_in()</span>
			<span class="arrow">=></span>
			<span class="return_value">Đà Nẵng, Việt Nam</span>
		</li>
	</ul>

	<div class="section"><h2>II. Education</h2></div>
	<ul>
		<li>
			<span class="function">awards()</span>
			<span class="arrow">=></span>
			<span class="return_value">[3rd Prize IT Competition for Youth at QuangNam Provincial]</span>
		</li>

		<li>
			<span class="function">degree()</span>
			<span class="arrow">=></span>
			<span class="return_value">Bachelor Da Nang University Major Auditing</span>
		</li>
	</ul>

	<div class="section"><h2>III. Work Life</h2></div>
	<ul>
		<li>
			<span class="function">total_year_of_experience()</span>
			<span class="arrow">=></span>
			<span class="return_value">5</span>
		</li>
		<li>
			<span class="function">roles()</span>
			<span class="arrow">=></span>
			<span class="return_value">[Backend, Devops, Frontend]</span>
		</li>
	</ul>

	<div class="section"><h2>IV. Tech Stacks</h2></div>
	<ul>
		<li>
			<span class="function">backend_stacks()</span>
			<span class="arrow">=></span>
			<span class="return_value">[Ruby on Rails, Nodejs, Golang]</span>
		</li>
		<li>
			<span class="function">frontend_stacks()</span>
			<span class="arrow">=></span>
			<span class="return_value">[React, Angular, Svetle]</span>
		</li>
		<li>
			<span class="function">devops_stacks()</span>
			<span class="arrow">=></span>
			<span class="return_value">[Kubernetes, Terraform, Ansible, Bash Script, Python, AWS]</span>
		</li>
	</ul>

	<div class="section"><h2>V. Others</h2></div>
	<ul>
		<li>
			<span class="function">favourite_editor()</span>
			<span class="arrow">=></span>
			<span class="return_value">Vim</span>
		</li>

		<li>
			<span class="function">favourite_os()</span>
			<span class="arrow">=></span>
			<span class="return_value">Linux</span>
		</li>

		<li>
			<span class="function">research_on_topics()</span>
			<span class="arrow">=></span>
			<span class="return_value"
				>[Microservice, Distributed System, System Design, Design Patterns]</span
			>
		</li>
		<li>
			<span class="function">habits()</span>
			<span class="arrow">=></span>
			<span class="return_value">[Read Book, Football, Build Site Projects]</span>
		</li>
	</ul>
</div>

<style>
	.wrapper {
		display: flex;
		flex-direction: column;
	}

	li {
		margin-bottom: 1rem;
	}

	ul {
		margin-top: 0;
		margin-bottom: 0;
	}

	.section {
		margin-bottom: 1rem;
	}
</style>
