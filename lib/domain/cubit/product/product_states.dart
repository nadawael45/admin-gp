class ProductStates{

}
class LoadingProduct extends ProductStates{}
class AddProductDone extends ProductStates{}
class AddProductFailed extends ProductStates{}

class ImageGallery extends ProductStates{}
class ImageCamera extends ProductStates{}
class AddImgDone extends ProductStates{}

class LoadingCategory extends ProductStates{}
class AddCategoryDone extends ProductStates{}
class AddCategoryFailed extends ProductStates{}




class GetProductSuccess extends ProductStates {}

class GetProductFailed extends ProductStates {}

class DeleteProductSuccess extends ProductStates {}

class DeleteProductFailed extends ProductStates {}

class End extends ProductStates{}