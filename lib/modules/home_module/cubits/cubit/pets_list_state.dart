part of 'pets_list_cubit.dart';

@freezed
sealed class PetsListState with _$PetsListState {
  const factory PetsListState.initial() = PetsListInitial;
  const factory PetsListState.petsListLoading() = PetsListLoading;
  const factory PetsListState.petsListError(String error) = PetsListError;
  const factory PetsListState.userPetsSuccess(UserPetsModel userPets) =
      UserPetsSuccess;
}
