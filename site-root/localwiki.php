<?php

HttpProxy::relayRequest(array(
	'url' => 'http://beta.wikidelphia.org'
	,'interface' => false // don't attempt to bind to public interface since amazon does funky routing
));