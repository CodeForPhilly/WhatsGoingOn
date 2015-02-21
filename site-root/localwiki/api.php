<?php

HttpProxy::relayRequest(array(
	'url' => LocalWiki::getFullURL('/api')
	,'interface' => false // don't attempt to bind to public interface since amazon does funky routing
));