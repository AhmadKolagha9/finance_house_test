// Mocks generated by Mockito 5.4.4 from annotations
// in finance_house_test/test/mock_classes.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:cookie_jar/cookie_jar.dart' as _i3;
import 'package:dio/dio.dart' as _i2;
import 'package:finance_house_test/data/dio/dio_settings.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCookieJar_1 extends _i1.SmartFake implements _i3.CookieJar {
  _FakeCookieJar_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2<T> extends _i1.SmartFake implements _i2.Response<T> {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DioSetting].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioSetting extends _i1.Mock implements _i4.DioSetting {
  MockDioSetting() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);

  @override
  _i3.CookieJar get cookieJar => (super.noSuchMethod(
        Invocation.getter(#cookieJar),
        returnValue: _FakeCookieJar_1(
          this,
          Invocation.getter(#cookieJar),
        ),
      ) as _i3.CookieJar);

  @override
  _i5.Future<_i2.Response<dynamic>> get({
    required String? subUrl,
    String? token,
    String? url,
    Map<String, dynamic>? queryParameters = const {},
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [],
          {
            #subUrl: subUrl,
            #token: token,
            #url: url,
            #queryParameters: queryParameters,
          },
        ),
        returnValue:
            _i5.Future<_i2.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #get,
            [],
            {
              #subUrl: subUrl,
              #token: token,
              #url: url,
              #queryParameters: queryParameters,
            },
          ),
        )),
      ) as _i5.Future<_i2.Response<dynamic>>);
}
