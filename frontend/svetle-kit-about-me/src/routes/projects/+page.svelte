<script>
	import ProjectCard from './ProjectCard.svelte';
</script>

<svelte:head>
	<title>Projects</title>
	<meta name="description" content="My Projects" />
</svelte:head>
<div class="wrapper">
	<ProjectCard
		timeLine="10/2022 - Now"
		companyName="PerxTech"
		label="Full Time"
		companyInfo={[
			'Loyalty Programming B2B and B2C Product in Singapore',
			'multiple tenant with heavy traffic every day'
		]}
		companyLink="https://www.perxtech.com"
		position="Senior Software Engineer"
		dailyWork={[
			'Solve complex issues, planning and designing for the new features',
			'Train and review code for members in the backend team',
			'Building new architectures'
		]}
	/>

	<ProjectCard
		timeLine="2/2022 - 12/2022"
		companyName="Productpine"
		label="Freelancer"
		companyInfo={['Ecommerce Product', 'Based in Nederlands']}
		companyLink="https://productpine.com/"
		position="Senior Backend Software Engineer"
		dailyWork={[
			'Build stable backend services',
			'Designing new architectures',
			'Migrate Ruby on Rails from version 2.7 to 3.1',
			'Refactoring and optimizing performant of heavy services',
			'Support and help to separate frontend code outside backend repo',
			'Build two ways syncing with shopify shop using graphql',
			'Review code for team members'
		]}
	/>

	<ProjectCard
		timeLine="4/2021 - 10/2022"
		companyName="Oivan"
		label="Full Time"
		companyInfo={[
			'Finland Outsource Company',
			'Working for many big projects in Saudi Arabia, Thailand and Finland'
		]}
		companyLink="https://oivan.com/"
		position="FullStack Software Developer"
		dailyWork={[
			'Working on microservice architecture',
			'Build stable backend api and messaging services using kafka',
			'Take responsibility for analyzing requirement and planing',
			'Guidance and review angular code for team members'
		]}
	/>

	<ProjectCard
		timeLine="4/2021 - 12/2021"
		companyName="Elxr"
		label="Freelancer"
		companyInfo={['Sport Product Company', 'Based in Singapore']}
		companyLink="https://elxr.sg/"
		position="Senior Backend Developer"
		dailyWork={[
			'Build a VOD (video on demand) services on AWS',
			'Setup pipeline processing video and initialize infra as code',
			'Monitoring AWS server, logging and costing',
			'Build business domain APIs',
			'Training new team members'
		]}
	/>

	<ProjectCard
		timeLine="8/2020 - 4/2021"
		companyName="Nucleus Studio (Renamed to DevBase)"
		label="Full Time"
		companyInfo={['Startup Outsource', 'Mainly working for England Client']}
		companyLink="https://devbase.us/"
		position="React Native Developer"
		dailyWork={[
			' Build an UI for React Native App',
			'Build a live stream on react native using agora third party',
			'Build a Payment System using braintree and In-App purchase for android and ios',
			'Setup Push Notification on app',
			'Sometimes working on nestjs backend api if team needed'
		]}
	/>

	<ProjectCard
		timeLine="10/2019 - 8/2020"
		companyName="Aleph Labs"
		label="Full Time"
		companyInfo={['Outsource Company', 'Mainly working for Singapore Client']}
		companyLink="https://www.aleph-labs.com/"
		position="Middle Full Stack Javascript Developer"
		dailyWork={[
			'Build Mobile App and Web App using React and React Native',
			'Project MTL Thailand Inc (Banking App) and UOB Bank Singapore (Banking Website)',
			'Working on platform team',
			'Build SDK Lib For Front end team and Back end team',
			'Help them integrate their code with micro-services infrastructure easily.'
		]}
	/>

	<ProjectCard
		timeLine="10/2018 - 9/2019"
		companyName="Framgia (Renamed to Sun*)"
		label="Full Time"
		companyInfo={['Japan Outsource Company']}
		companyLink="https://sun-asterisk.vn/"
		position="Junior Developer"
		dailyWork={[
			'Working on React and Ruby on Rails Projects',
			'First time interact with graphql library Appollo'
		]}
	/>
</div>
