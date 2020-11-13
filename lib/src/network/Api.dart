import 'dart:async';
import 'dart:convert';

import 'package:cleanarch/network.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class Api {
	final String host;
	final String context;
	final IHttpClientBuilder _clientBuilder;

	Api(this.host, this.context, this._clientBuilder);

	@protected
	Uri _buildUrl([String endpoint = '']) {
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
			final url = _buildUrl(endpoint);

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
			final url = _buildUrl(endpoint);

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
