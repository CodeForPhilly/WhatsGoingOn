{extends designs/site.tpl}

{block content}
	<!-- ******************** HeaderWrap ********************-->
	<div id="headerwrap">
	  <header class="clearfix">
	    <h1>We’re gathering information about after school and summer programs. Want to know what’s going on? <span>Join Us!</span></h1>
	    <div class="container">
	      <div class="row">
	        <form class="span12" action="/subscribe" method="POST">
	          <h2>Sign Up for our Newsletter</h2>
	          <input type="text" name="Email" placeholder="you@yourmail.com" class="cform-text" size="40" title="your email">
	          <input type="submit" value="Notify me" class="cform-submit">
	        </form>
	      </div>
	      <div class="row">
	        <div class="span12">
	          <ul class="icon">
	            {*<li><a href="#" target="_blank"><i class="icon-pinterest-circled"></i></a></li>*}
	            <li><a href="https://www.facebook.com/WhatsGoingOnPHL" target="_blank"><i class="icon-facebook-circled"></i></a></li>
	            <li><a href="http://twitter.com/WhatsGoingOnPHL" target="_blank"><i class="icon-twitter-circled"></i></a></li>
	            {*<li><a href="#" target="_blank"><i class="icon-gplus-circled"></i></a></li>*}
	            {*<li><a href="#" target="_blank"><i class="icon-skype-circled"></i></a></li>*}
	          </ul>
	        </div>
	      </div>
	    </div>
	  </header>
	</div>
	
	<!--******************** Contact Section ********************-->
	<section id="contact" class="single-page scrollblock">
	  <div class="container">
	    <div class="align"><i class="icon-mail-2"></i></div>
	    <h1>Tell Us What's Going On!</h1>
	    <div class="row">
	      <div class="span12">
	        <div class="cform" id="theme-form">
	          <form action="/contact" method="post" class="cform-form">
				<fieldset>
					<legend>Program Information</legend>
		            <div class="row">
		              <div class="span4"> <span class="program-name">
		                <input type="text" name="programName" placeholder="Program Name" class="cform-text" size="40" title="program name">
		                </span> </div>
		              <div class="span4"> <span class="street-addr">
		                <input type="text" name="streetAddress" placeholder="Street Address" class="cform-text" size="40" title="street addr">
		                </span> </div>
					  <div class="span4"> <span class="web-site">
		                <input type="text" name="website" placeholder="Website (optional)" class="cform-text" size="40" title="web site">
		                </span> </div>
		            </div>
	
		            <div class="row">
		              <div class="span4"> <span class="contact-person">
		                <input type="text" name="contactPerson" placeholder="Contact Person" class="cform-text" size="40" title="contact person">
		                </span> </div>
		              <div class="span4"> <span class="contact-phone">
		                <input type="text" name="contactPhone" placeholder="Phone Number" class="cform-text" size="40" title="phone number">
		                </span> </div>
					  <div class="span4"> <span class="email-addr">
		                <input type="text" name="contactEmail" placeholder="Email Address" class="cform-text" size="40" title="email addr">
		                </span> </div>
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
						</div>
					</div>
	
					<div class="row">
						<div class="span2">Season(s)</div>
						<div class="span10">
							<label class="checkbox inline"><input type="checkbox" name="season[]" value="summer">Summer</label>
							<label class="checkbox inline"><input type="checkbox" name="season[]" value="scholyear">School year</label>
						</div>
					</div>
	
					<div class="row">
						<div class="span2">Subject(s)</div>
						<div class="span10">
							<label class="checkbox inline"><input type="checkbox" name="subject[]" value="art">Art</label>
							<label class="checkbox inline"><input type="checkbox" name="subject[]" value="athletics">Athletics</label>
							<label class="checkbox inline"><input type="checkbox" name="subject[]" value="writing">Writing</label>
							<label class="checkbox inline"><input type="checkbox" name="subject[]" value="reading">Reading</label>
							<label class="checkbox inline"><input type="checkbox" name="subject[]" value="science">Science</label>
							<label class="checkbox inline"><input type="checkbox" name="subject[]" value="technology">Technology</label>
							<label class="checkbox inline"><input type="checkbox" name="subject[]" value="engineering">Engineering</label>
							<label class="checkbox inline"><input type="checkbox" name="subject[]" value="math">Math</label>
						</div>
					</div>

					<div class="row">
						<div class="span2">Free?</div>
						<div class="span10">
							<label class="checkbox inline"><input type="checkbox" name="free" value="yes">Yes</label>
						</div>
					</div>
				</fieldset>

				<fieldset>
					<legend>Optional: Comments and how to contact you</legend>

		            <div class="row">
		              <div class="span12"> <span class="message">
						Comments:
		                <textarea name="message" class="cform-textarea" cols="40" rows="10" title="Suggestions, ideas or comments."></textarea>
		                </span> </div>
		            </div>

		            <div class="row">
		              <div class="span4"> <span class="contact-person">
		                <input type="text" name="Name" placeholder="Your Name" class="cform-text" size="40" title="your name">
		                </span> </div>
		              <div class="span4"> <span class="contact-phone">
		                <input type="text" name="Phone" placeholder="Your Phone Number" class="cform-text" size="40" title="your phone number">
		                </span> </div>
					  <div class="span4"> <span class="email-addr">
		                <input type="text" name="Email" placeholder="Your Email Address" class="cform-text" size="40" title="your email address">
		                </span> </div>
		            </div>
				</fieldset>

	            <div>
	              <input type="submit" value="Submit program" class="cform-submit pull-left">
	            </div>
	            <div class="cform-response-output"></div>
	          </form>
	        </div>
	      </div>
	      <!-- ./span12 -->
	    </div>
	    <!-- /.row -->
	  </div>
	  <!-- /.container -->
	</section>
{/block}