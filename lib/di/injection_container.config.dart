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

import '../conversation/bloc/conversation_bloc.dart' as _i9;
import '../conversation/bloc/conversation_details_bloc.dart' as _i10;
import '../network/client_provider.dart' as _i3;
import '../network/repository/conversation_repository_impl.dart' as _i8;
import '../network/rest_client_public.dart' as _i6;
import '../repository/conversation_data_storage.dart' as _i4;
import '../repository/conversation_repository.dart' as _i7;
import '../storage/memory_data_storage.dart' as _i5;

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
    gh.lazySingleton<_i4.ConversationDataStorage>(
        () => _i5.MemoryDataStorage());
    gh.lazySingleton<_i6.RestClientPublic>(
        () => _i6.RestClientPublic(gh<_i3.ClientProvider>()));
    gh.lazySingleton<_i7.ConversationRepository>(
        () => _i8.ConversationRepositoryImpl(
              gh<_i6.RestClientPublic>(),
              gh<_i4.ConversationDataStorage>(),
            ));
    gh.factory<_i9.ConversationBloc>(
        () => _i9.ConversationBloc(gh<_i7.ConversationRepository>()));
    gh.factory<_i10.ConversationDetailBloc>(() => _i10.ConversationDetailBloc(
          gh<_i7.ConversationRepository>(),
          gh<_i4.ConversationDataStorage>(),
        ));
    return this;
  }
}
