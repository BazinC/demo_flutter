// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StatusStateTearOff {
  const _$StatusStateTearOff();

// ignore: unused_element
  Loaded loaded(List<Status> status) {
    return Loaded(
      status,
    );
  }

// ignore: unused_element
  Error error(String message, List<Status> status) {
    return Error(
      message,
      status,
    );
  }

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  Loading loading(List<Status> status) {
    return Loading(
      status,
    );
  }
}

// ignore: unused_element
const $StatusState = _$StatusStateTearOff();

mixin _$StatusState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(List<Status> status),
    @required Result error(String message, List<Status> status),
    @required Result initial(),
    @required Result loading(List<Status> status),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(List<Status> status),
    Result error(String message, List<Status> status),
    Result initial(),
    Result loading(List<Status> status),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(Loaded value),
    @required Result error(Error value),
    @required Result initial(Initial value),
    @required Result loading(Loading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(Loaded value),
    Result error(Error value),
    Result initial(Initial value),
    Result loading(Loading value),
    @required Result orElse(),
  });
}

abstract class $StatusStateCopyWith<$Res> {
  factory $StatusStateCopyWith(
          StatusState value, $Res Function(StatusState) then) =
      _$StatusStateCopyWithImpl<$Res>;
}

class _$StatusStateCopyWithImpl<$Res> implements $StatusStateCopyWith<$Res> {
  _$StatusStateCopyWithImpl(this._value, this._then);

  final StatusState _value;
  // ignore: unused_field
  final $Res Function(StatusState) _then;
}

abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({List<Status> status});
}

class _$LoadedCopyWithImpl<$Res> extends _$StatusStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object status = freezed,
  }) {
    return _then(Loaded(
      status == freezed ? _value.status : status as List<Status>,
    ));
  }
}

class _$Loaded implements Loaded {
  const _$Loaded(this.status) : assert(status != null);

  @override
  final List<Status> status;

  @override
  String toString() {
    return 'StatusState.loaded(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(List<Status> status),
    @required Result error(String message, List<Status> status),
    @required Result initial(),
    @required Result loading(List<Status> status),
  }) {
    assert(loaded != null);
    assert(error != null);
    assert(initial != null);
    assert(loading != null);
    return loaded(status);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(List<Status> status),
    Result error(String message, List<Status> status),
    Result initial(),
    Result loading(List<Status> status),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(Loaded value),
    @required Result error(Error value),
    @required Result initial(Initial value),
    @required Result loading(Loading value),
  }) {
    assert(loaded != null);
    assert(error != null);
    assert(initial != null);
    assert(loading != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(Loaded value),
    Result error(Error value),
    Result initial(Initial value),
    Result loading(Loading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements StatusState {
  const factory Loaded(List<Status> status) = _$Loaded;

  List<Status> get status;
  $LoadedCopyWith<Loaded> get copyWith;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String message, List<Status> status});
}

class _$ErrorCopyWithImpl<$Res> extends _$StatusStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object message = freezed,
    Object status = freezed,
  }) {
    return _then(Error(
      message == freezed ? _value.message : message as String,
      status == freezed ? _value.status : status as List<Status>,
    ));
  }
}

class _$Error implements Error {
  const _$Error(this.message, this.status)
      : assert(message != null),
        assert(status != null);

  @override
  final String message;
  @override
  final List<Status> status;

  @override
  String toString() {
    return 'StatusState.error(message: $message, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(status);

  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(List<Status> status),
    @required Result error(String message, List<Status> status),
    @required Result initial(),
    @required Result loading(List<Status> status),
  }) {
    assert(loaded != null);
    assert(error != null);
    assert(initial != null);
    assert(loading != null);
    return error(message, status);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(List<Status> status),
    Result error(String message, List<Status> status),
    Result initial(),
    Result loading(List<Status> status),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(Loaded value),
    @required Result error(Error value),
    @required Result initial(Initial value),
    @required Result loading(Loading value),
  }) {
    assert(loaded != null);
    assert(error != null);
    assert(initial != null);
    assert(loading != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(Loaded value),
    Result error(Error value),
    Result initial(Initial value),
    Result loading(Loading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements StatusState {
  const factory Error(String message, List<Status> status) = _$Error;

  String get message;
  List<Status> get status;
  $ErrorCopyWith<Error> get copyWith;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$StatusStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'StatusState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(List<Status> status),
    @required Result error(String message, List<Status> status),
    @required Result initial(),
    @required Result loading(List<Status> status),
  }) {
    assert(loaded != null);
    assert(error != null);
    assert(initial != null);
    assert(loading != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(List<Status> status),
    Result error(String message, List<Status> status),
    Result initial(),
    Result loading(List<Status> status),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(Loaded value),
    @required Result error(Error value),
    @required Result initial(Initial value),
    @required Result loading(Loading value),
  }) {
    assert(loaded != null);
    assert(error != null);
    assert(initial != null);
    assert(loading != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(Loaded value),
    Result error(Error value),
    Result initial(Initial value),
    Result loading(Loading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements StatusState {
  const factory Initial() = _$Initial;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
  $Res call({List<Status> status});
}

class _$LoadingCopyWithImpl<$Res> extends _$StatusStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;

  @override
  $Res call({
    Object status = freezed,
  }) {
    return _then(Loading(
      status == freezed ? _value.status : status as List<Status>,
    ));
  }
}

class _$Loading implements Loading {
  const _$Loading(this.status) : assert(status != null);

  @override
  final List<Status> status;

  @override
  String toString() {
    return 'StatusState.loading(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loading &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @override
  $LoadingCopyWith<Loading> get copyWith =>
      _$LoadingCopyWithImpl<Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(List<Status> status),
    @required Result error(String message, List<Status> status),
    @required Result initial(),
    @required Result loading(List<Status> status),
  }) {
    assert(loaded != null);
    assert(error != null);
    assert(initial != null);
    assert(loading != null);
    return loading(status);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(List<Status> status),
    Result error(String message, List<Status> status),
    Result initial(),
    Result loading(List<Status> status),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(Loaded value),
    @required Result error(Error value),
    @required Result initial(Initial value),
    @required Result loading(Loading value),
  }) {
    assert(loaded != null);
    assert(error != null);
    assert(initial != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(Loaded value),
    Result error(Error value),
    Result initial(Initial value),
    Result loading(Loading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements StatusState {
  const factory Loading(List<Status> status) = _$Loading;

  List<Status> get status;
  $LoadingCopyWith<Loading> get copyWith;
}
