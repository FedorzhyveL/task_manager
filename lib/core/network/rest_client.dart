import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task_manager/core/network/rest_constants.dart';
import 'package:task_manager/data/dtos/task_dto.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://hive.mrdekk.ru/todo')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(RestConstants.listOfTasks)
  Future<TasksDto> getTasks();

  @PATCH(RestConstants.listOfTasks)
  Future<TasksDto> updateTasks(
    @Header('X-Last-Known-Revision') int revision,
    @Body() Map<String, dynamic> list,
  );

  @GET(RestConstants.singleTask)
  Future<TaskDto> getTask(
    @Path('id') String id,
    @Header('X-Last-Known-Revision') int revision,
  );

  @POST(RestConstants.listOfTasks)
  Future<TaskDto> createTask(
    @Header('X-Last-Known-Revision') int revision,
    @Body() Map<String, dynamic> element,
  );

  @PUT(RestConstants.singleTask)
  Future<TaskDto> editTask(
    @Header('X-Last-Known-Revision') int revision,
    @Path('id') String id,
    @Body() Map<String, dynamic> element,
  );

  @DELETE(RestConstants.singleTask)
  Future<TaskDto> deleteTask(
    @Path('id') String id,
    @Header('X-Last-Known-Revision') int revision,
    @Body() Map<String, dynamic> element,
  );
}
