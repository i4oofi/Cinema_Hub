import 'dart:io';

void printTree(Directory directory, [String prefix = ""]) {
  final List<FileSystemEntity> entities = directory.listSync();
  for (var entity in entities) {
    if (entity is File) {
      print("$prefix- ${entity.path.split('/').last}"); // عرض اسم الملف
    } else if (entity is Directory) {
      print("$prefix+ ${entity.path.split('/').last}"); // عرض اسم المجلد
      printTree(entity, "$prefix  "); // استدعاء الدالة للمجلدات الفرعية
    }
  }
}

void main() {
  final Directory libDir = Directory('lib');

  if (!libDir.existsSync()) {
    print("lib folder not found!");
    return;
  }

  print("lib folder tree analysis:");
  printTree(libDir);
}
