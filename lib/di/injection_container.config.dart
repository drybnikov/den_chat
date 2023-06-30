// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../conversation/bloc/conversation_bloc.dart' as _i7;
import '../network/client_provider.dart' as _i3;
import '../network/repository/conversation_repository_impl.dart' as _i6;
import '../network/rest_client_public.dart' as _i4;
import '../repository/conversation_repository.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ClientProvider>(() => _i3.ClientProvider());
    gh.lazySingleton<_i4.RestClientPublic>(
        () => _i4.RestClientPublic(gh<_i3.ClientProvider>()));
    gh.factory<_i5.ConversationRepository>(
        () => _i6.ConversationRepositoryImpl(gh<_i4.RestClientPublic>()));
    gh.factory<_i7.ConversationBloc>(
        () => _i7.ConversationBloc(gh<_i5.ConversationRepository>()));
    return this;
  }
}
