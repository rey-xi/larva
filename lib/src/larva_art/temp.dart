part of larva.art;

/// Sector (-01)
const _temp = LarvaArtCurl._(
  //...
  env: '',
  head: '',
  cloth: '',
  mouth: '',
  eyes: '',
  hair: '',
  a: LarvaToneCurl(
    env: ["#ff2f2b"],
    cloth: ["#fff", "#000"],
    head: ["#fff"],
    mouth: ["#fff", "#000", "#000"],
    eyes: ["#000", "none", "#00FFFF"],
    hair: ["#fff", "#fff"],
  ),
  b: LarvaToneCurl(
    env: ["#ff1ec1"],
    cloth: ["#000", "#fff"],
    head: ["#ffc1c1"],
    mouth: ["#fff", "#000", "#000"],
    eyes: ["#FF2D00", "#fff", "none"],
    hair: ["#a21d00", "#fff"],
  ),
  c: LarvaToneCurl(
    env: ["#0079b1"],
    cloth: ["#0e00b1", "#d1fffe"],
    head: ["#f5aa77"],
    mouth: ["#fff", "#000", "#000"],
    eyes: ["#0c00de", "#fff", "none"],
    hair: ["#acfffd", "#acfffd"],
  ),
);
