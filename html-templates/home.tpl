{extends designs/site.tpl}

{block content-wrapper-open}{/block}
{block content-wrapper-close}{/block}
{block content}
	<div class="container anchor-target" id="about">

		<div class="row">
			<div class="span7">
				<h1>What is this?</h1>
				<p>We understand. Parenting is hard. Finding an after school or summer program for children shouldn&rsquo;t be.</p>
				<p>What&rsquo;s Going On makes it easy to find safe, productive activities for your child.</p>
			</div>
			<aside class="span5">
				<h2>Powered by WikiDelphia</h2>
				<p>What&rsquo;s Going On is powered by <a href="http://beta.wikidelphia.org">WikiDelphia</a> &mdash; a wiki by and for the people of Philadelphia. It is the same concept that powers the popular crowd-edited encyclopedia Wikipedia, but Wikipedia has a <em>notability requirement</em> that limits its content to pages of interest to the whole world.</p>
				<p>Unlike Wikipedia, <strong>WikiDelphia</strong>'s requirement is that pages are interesting to <em>Philadelphians</em>, allowing us to create pages for anything and everything inside and around Philadelphia. Every program in What&rsquo;s Going On is really just a tagged page in <strong>WikiDelphia</strong> that anyone can add or improve.</p>
			</aside>
		</div>
	</div> <!-- /container -->


	<div class="container anchor-target" id="find">

		<h1>Find Programs</h1>
		<p>You can browse <a href="http://beta.wikidelphia.org/After-School_Programs">WikiDelphia's after school programs page</a> directly, or use this convenient page to search it. A <a href="/mobile">mobile-optimized version</a> is also available for easier use on mobile devices like phones and tablets.</p>
		
		<div class="row">
			<div class="span3">
				<div class="well well-small control-group subject-section">
					<h3>By Subject</h3>
					<div class="controls filter-group">
						<form>
							<label class="radio">
								<input type="radio" name="subject" value="" checked="checked">
								All
							</label>
							<label class="radio">
								<input type="radio" name="subject" value="afterschoolprogrammath" >
								Math
							</label>
							<label class="radio">
								<input type="radio" name="subject" value="afterschoolprogramscience" >
								Science
							</label>
							<label class="radio">
								<input type="radio" name="subject" value="afterschoolprogramreading" >
								Reading
							</label>
							<label class="radio">
								<input type="radio" name="subject" value="afterschoolprogramwriting" >
								Writing
							</label>
							<label class="radio">
								<input type="radio" name="subject" value="afterschoolprogramtechnology">
								Technology
							</label>
							<label class="radio">
								<input type="radio" name="subject" value="afterschoolprogramengineering" >
								Engineering
							</label>
							<label class="radio">
								<input type="radio" name="subject" value="afterschoolprogramart" >
								Arts
							</label>
							<label class="radio">
								<input type="radio" name="subject" value="athletics" >
								Athletics
							</label>
						</form>
					</div>
				</div>
			</div>
			<div class="span3">
				<div class="well well-small control-group age-section">
					<h3>By Age-Level</h3>
					<div class="controls filter-group">
						<form>
							<label class="radio">
								<input type="radio" name="age" value="" checked="checked">
								All
							</label>
							<label class="radio">
								<input type="radio" name="age" value="afterschoolprogramhighschool">
								High school
							</label>
							<label class="radio">
								<input type="radio" name="age" value="afterschoolprogrammiddleschool">
								Middle school
							</label>
							<label class="radio">
								<input type="radio" name="age" value="afterschoolprogramelementaryschool">
								Elementary school
							</label>
						</form>
					</div>
				</div>
				<div class="well well-small control-group season-section">
					<h3>By Season</h3>
					<div class="controls filter-group">
						<form>
							<label class="radio">
								<input type="radio" name="season" value="" checked="checked">
								All
							</label>
							<label class="radio">
								<input type="radio" name="season" value="afterschoolprogramsummer">
								Summer
							</label>
							<label class="radio">
								<input type="radio" name="season" value="afterschoolprogramschoolyear">
								School-year
							</label>
							<label class="radio">
								<input type="radio" name="season" value="afterschoolprogramyearround">
								Year-round
							</label>
						</form>
					</div>
				</div>
			</div>
			<div class="span6 results-column">
				<div id="map"></div>
				<h2>Search Results</h2>
				<div class="search-results">
					
				</div>
				<img class="spinner" src="/img/loader.gif"></img>
			</div>
		</div>

	</div> <!-- /container -->


	<div class="container anchor-target" id="share">

		<h1>Share Programs</h1>
		<p>Know about a program that isn&rsquo;t listed? You can <a href="/create-a-page">create the page yourself</a> in WikiDelphia, or use the simple form below to tip-off the What&rsquo;s Going On volunteers and we&rsquo;ll handle creating the page.</p>

		<form action="/contact" method="POST">
			<fieldset>
				<legend>Program Information</legend>
				<div class="row">
					<div class="span4">
						<label class="control-label" for="programName">Program Name:</label>
						<div class="controls">
							<input type="text" name="programName" size="40">
						</div>
					</div>
					<div class="span4">
						<label class="control-label" for="streetAddress">Street Address:</label>
						<div class="controls">
							<input type="text" name="streetAddress" size="40">
						</div>
					</div>
					<div class="span4">
						<label class="control-label" for="website">Website (optional):</label>
						<div class="controls">
							<input type="text" name="website" size="40">
						</div>
					</div>
				</div>
		
				<div class="row">
					<div class="span4">
						<label class="control-label" for="contactPerson">Contact Person:</label>
						<div class="controls">
							<input type="text" name="contactPerson" size="40">
						</div>
					</div>
					<div class="span4">
						<label class="control-label" for="contactPhone">Contact Phone:</label>
						<div class="controls">
							<input type="text" name="contactPhone" size="40">
						</div>
					</div>
					<div class="span4">
						<label class="control-label" for="contactEmail">Contact Email:</label>
						<div class="controls">
							<input type="text" name="contactEmail" size="40">
						</div>
					</div>
				</div>
			</fieldset>
		
			<fieldset>
				<legend>Check all that apply (if you know)</legend>
				<div class="row">
					<div class="span2">Age(s)</div>
					<div class="span10">
						<label class="checkbox inline"><input type="checkbox" name="gradeLevel[]" value="highschool">High school</label>
						<label class="checkbox inline"><input type="checkbox" name="gradeLevel[]" value="middleschool">Middle school</label>
						<label class="checkbox inline"><input type="checkbox" name="gradeLevel[]" value="elementaryschool">Elementary school</label>
						<hr>
					</div>
				</div>
		
				<div class="row">
					<div class="span2">Season(s)</div>
					<div class="span10">
						<label class="checkbox inline"><input type="checkbox" name="season[]" value="summer">Summer</label>
						<label class="checkbox inline"><input type="checkbox" name="season[]" value="schoolyear">School year</label>
						<hr>
					</div>
				</div>
		
				<div class="row">
					<div class="span2">Subject(s)</div>
					<div class="span2">
						<label class="checkbox inline"><input type="checkbox" name="subject[]" value="art">Art</label><br />
						<label class="checkbox inline"><input type="checkbox" name="subject[]" value="athletics">Athletics</label><br />
						<label class="checkbox inline"><input type="checkbox" name="subject[]" value="writing">Writing</label><br />
						<label class="checkbox inline"><input type="checkbox" name="subject[]" value="reading">Reading</label><br />							
						<hr>
					</div>					
					<div class="span8">
						<label class="checkbox inline"><input type="checkbox" name="subject[]" value="science">Science</label><br />
						<label class="checkbox inline"><input type="checkbox" name="subject[]" value="technology">Technology</label><br />
						<label class="checkbox inline"><input type="checkbox" name="subject[]" value="engineering">Engineering</label><br />
						<label class="checkbox inline"><input type="checkbox" name="subject[]" value="math">Math</label><br />
						<hr>
					</div>
				</div>
		
				<div class="row">
					<div class="span2">Free?</div>
					<div class="span10">
						<label class="checkbox inline"><input type="checkbox" name="free" value="yes">Yes</label>
					</div>
				</div>

				<div class="row">
					<div class="span12">&nbsp;</div>
				</div>
			</fieldset>
		
			<fieldset>
				<legend>Optional: Comments and how to contact you</legend>
		
				<div class="row">
				  <div class="span12"> <span class="message">
					<label>Comments</label>
					<textarea name="message" class="cform-textarea input-block-level" cols="40" rows="5" title="Suggestions, ideas or comments."></textarea>
					</span> </div>
				</div>
		
				<div class="row">
				  <div class="span4"> <span class="contact-person">
					<label>Your Name</label>
					<input type="text" name="Name" class="cform-text" size="40" title="your name">
					</span> </div>
				  <div class="span4"> <span class="contact-phone">
					<label>Your Phone Number</label>
					<input type="text" name="Phone" class="cform-text" size="40" title="your phone number">
					</span> </div>
				  <div class="span4"> <span class="email-addr">
					<label>Your Email Address</label>
					<input type="text" name="Email" class="cform-text" size="40" title="your email address">
					</span> </div>
				</div>
			</fieldset>
		
			<div>
				<input type="submit" value="Submit program" class="cform-submit pull-left">
			</div>
		</form>
	</div> <!-- /container -->
{/block}