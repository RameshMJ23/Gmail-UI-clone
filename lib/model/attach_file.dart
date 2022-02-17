enum FileType{
  word,
  pdf,
  image,
  excel
}

class AttachedFile{
  late FileType? fileType;
  late String? fileName;
  late bool isAttached;

  AttachedFile(
    {
      required this.isAttached,
      required this.fileName,
      required this.fileType,
    }
  );
}