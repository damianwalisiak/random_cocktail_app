// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchDetailsState {
  CocktailModel? get model => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchDetailsStateCopyWith<SearchDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDetailsStateCopyWith<$Res> {
  factory $SearchDetailsStateCopyWith(
          SearchDetailsState value, $Res Function(SearchDetailsState) then) =
      _$SearchDetailsStateCopyWithImpl<$Res, SearchDetailsState>;
  @useResult
  $Res call({CocktailModel? model, Status status, String? errorMessage});

  $CocktailModelCopyWith<$Res>? get model;
}

/// @nodoc
class _$SearchDetailsStateCopyWithImpl<$Res, $Val extends SearchDetailsState>
    implements $SearchDetailsStateCopyWith<$Res> {
  _$SearchDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CocktailModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CocktailModelCopyWith<$Res>? get model {
    if (_value.model == null) {
      return null;
    }

    return $CocktailModelCopyWith<$Res>(_value.model!, (value) {
      return _then(_value.copyWith(model: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SearchDetailsStateCopyWith<$Res>
    implements $SearchDetailsStateCopyWith<$Res> {
  factory _$$_SearchDetailsStateCopyWith(_$_SearchDetailsState value,
          $Res Function(_$_SearchDetailsState) then) =
      __$$_SearchDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CocktailModel? model, Status status, String? errorMessage});

  @override
  $CocktailModelCopyWith<$Res>? get model;
}

/// @nodoc
class __$$_SearchDetailsStateCopyWithImpl<$Res>
    extends _$SearchDetailsStateCopyWithImpl<$Res, _$_SearchDetailsState>
    implements _$$_SearchDetailsStateCopyWith<$Res> {
  __$$_SearchDetailsStateCopyWithImpl(
      _$_SearchDetailsState _value, $Res Function(_$_SearchDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_SearchDetailsState(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CocktailModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SearchDetailsState extends _SearchDetailsState {
  _$_SearchDetailsState(
      {this.model = null, this.status = Status.initial, this.errorMessage = ''})
      : super._();

  @override
  @JsonKey()
  final CocktailModel? model;
  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'SearchDetailsState(model: $model, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchDetailsState &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchDetailsStateCopyWith<_$_SearchDetailsState> get copyWith =>
      __$$_SearchDetailsStateCopyWithImpl<_$_SearchDetailsState>(
          this, _$identity);
}

abstract class _SearchDetailsState extends SearchDetailsState {
  factory _SearchDetailsState(
      {final CocktailModel? model,
      final Status status,
      final String? errorMessage}) = _$_SearchDetailsState;
  _SearchDetailsState._() : super._();

  @override
  CocktailModel? get model;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SearchDetailsStateCopyWith<_$_SearchDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
