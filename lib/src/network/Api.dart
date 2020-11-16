import 'dart:async';
import 'dart:convert';

import 'package:cleanarch/log.dart';
import 'package:cleanarch/network.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class Api
{
	@protected final String host;
	@protected final String context;
	@protected final ILogger logger;
	final IHttpClientBuilder _clientBuilder;

	Api(this.host, this.context, this._clientBuilder, this.logger);

	@protected
	Uri buildUrl([String endpoint = '']) {
		if (endpoint.isEmpty) {
			return Uri.parse(host);
		}
		return Uri.parse('$host$endpoint');
	}

	@protected
	Future<http.Response> get(String endpoint,
			{Map<String, String> headers = const {},
				dynamic body,
				Encoding encoding = utf8,
				Duration timeout = const Duration(seconds: 30)}) async
	{
		final client = _clientBuilder.buildClient();

		try {
			final url = buildUrl(endpoint);

			final timeout = const Duration(seconds: 30);

			final response = await client.post(
					url, headers: headers, body: body, encoding: encoding)
					.timeout(timeout);

			return response;
		}
		finally {
			client.close();
		}
	}

	@protected
	Future<http.Response> post(String endpoint,
			{Map<String, String> headers = const {},
				dynamic body,
				Encoding encoding = utf8,
				Duration timeout = const Duration(seconds: 30)}) async
	{
		final client = _clientBuilder.buildClient();

		try {
			final url = buildUrl(endpoint);

			final timeout = const Duration(seconds: 30);

			final response = await client.post(
					url, headers: headers, body: body, encoding: encoding)
					.timeout(timeout);

			return response;
		}
		finally {
			client.close();
		}
	}
}
