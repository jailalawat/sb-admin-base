class ImageJob < ActiveJob::Base
  queue_as :default

    def hello
      # Open an image from a website

      # image = MiniMagick::Image.open("https://s3.amazonaws.com/StartupStockPhotos/20140808_StartupStockPhotos/85.jpg")
      imagePrint = MiniMagick::Image.new('public/uploads/mask.png')
      file = File.read('public/uploads/sample.json')
      printData = JSON.parse(file)
      
      mask = "public/uploads/mask.png"; #a image (4395x4395) which contains 2669x4395 black fill in center
      maskImg = MiniMagick::Image.new(mask)
      maskWidth = maskImg.width
      maskHeight = maskImg.height

      #Then reduce any list of integer
      cd = array_reduce([maskWidth, 400], 'gcd');
      # r1 = maskWidth / cd;
      # r2 = 400 / cd;
      r1 = maskWidth
      r2 = maskHeight
      newPrintData = {r1: r1, r2: r2}
      
      # # Get the Image's width
      # image.width # 4928

      # # Get the image's height
      # image.height #3264
      # image.combine_options do |i|
      #     i.resize "2048x1536"
      #     i.flip
      #     i.rotate "-45"
      #     i.blur "0x15"
      # end
      # image.write "public/uploads/blur.png"
    
      printData['objects'].each do |layer|
          if layer['type'] =='image'
              addImageToLarge(layer,imagePrint,layer, newPrintData)
          end
      end
  end

  # id = _GET['id'];
  # file = id . ".json"; #json file e.g. 1234.json
  # printData = json_decode(file_get_contents(file));

  # mask = "mask.png"; #a image (4395x4395) which contains 2669x4395 black fill in center
  # maskImg = new Imagick(mask);
  # d = maskImg.getImageGeometry();

  # maskWidth = d['width'];
  # maskHeight = d['height'];

  # #Then reduce any list of integer
  # cd = array_reduce(array(maskWidth, 400), 'gcd');
  # r1 = maskWidth / cd;
  # r2 = 400 / cd;

  # newPrintData['r1'] = r1;
  # newPrintData['r2'] = r2;


  # try {
  #     print = new Imagick();
  #     print.setResolution(300, 300);
  #     background = (empty(printData.json_data.background)) ? 'transparent' : printData.json_data.background;
  #     print.newImage(maskWidth, maskHeight, new ImagickPixel(background));

  #     print.setImageMatte(TRUE);
  #     print.setImageFormat('png32');
  #     print.setImageUnits(imagick::RESOLUTION_PIXELSPERCENTIMETER);
  # } catch (Exception e) {
  #     echo e.getMessage();
  # }

  # #create two array for store text & images information separately 
  # imageObjects = textObjects = [];

  # foreach (printData.json_data.objects as object) {
  #     if (object.type == 'image') {
  #         imageObjects[] = object;
  #     } else if (object.type == 'text') {
  #         imageObjects[] = object;
  #     }
  # }
  # foreach (imageObjects as object) {
  #     addImageToLarge(object, print, printData, newPrintData);
  # }

  # foreach (imageObjects as object) {
  #     addTextToLarge(object, print, printData, newPrintData);
  # }
  # try {
  #     print.setImageFormat('png');
  #     saveFile = id . "_print.json"; #save large image _print.png
  #     file_put_contents(saveFile, print);
  # } catch (Exception e) {
  #     echo e.getMessage();
  #     exit();
  # }

  def addImageToLarge(object, print, printData, newPrintData) 
          
          src = MiniMagick::Image.new(object["src"])
          resizeWidth = changeDpi(scale(object['width'], newPrintData[:r1], newPrintData[:r2]) * object['scaleX']);
          resizeHeight = changeDpi(scale(object['height'], newPrintData[:r1], newPrintData[:r2]) * object['scaleY']);
          
          src.resize "#{resizeWidth}x#{resizeHeight}"
          src.rotate object['angle']
          
          left = object['left'] < 0 ? -1 * changeDpi(scale(object['left'], newPrintData[:r1], newPrintData[:r2])).abs : changeDpi(scale(object['left'], newPrintData[:r1], newPrintData[:r2]))
          top = object['top'] < 0 ? -1 * changeDpi(scale(object['top'], newPrintData[:r1], newPrintData[:r2])).abs : changeDpi(scale(object['top'], newPrintData[:r1], newPrintData[:r2]))
          print = print.composite(src) do |c|
              c.compose "Over"
              c.geometry "#{left}x#{top}"
          end            

  end

  # def addTextToLarge(object, print, printData, newPrintData) 
  #     fnt['Times New Roman'] = "font/times_6.ttf";
  #     fnt['Arial'] = "font/arial_8.ttf";
  #     fnt['Arial Black'] = "font/ariblk_8.ttf";
  #     fnt['Comic Sans MS'] = "font/comic_5.ttf";
  #     fnt['Courier New'] = "font/cour_5.ttf";
  #     fnt['Georgia'] = "font/georgia_5.ttf";
  #     fnt['Impact'] = "font/impact_7.ttf";
  #     fnt['Lucida Console'] = "font/lucon_3.ttf";
  #     fnt['Lucida Sans Unicode'] = "font/l_4.ttf";
  #     fnt['Palatino Linotype'] = "font/pala_7.ttf";
  #     fnt['Tahoma'] = "font/tahoma_3.ttf";
  #     fnt['Trebuchet MS'] = "font/trebuc_3.ttf";
  #     fnt['Verdana'] = "font/verdana_5.ttf";

  #     try {
  #         line_height_ratio = object['lineHeight'];
  #         resizeWidth = changeDpi(scale(object.width, newPrintData['r1'], newPrintData['r2']) * object.scaleX);
  #         resizeHeight = changeDpi(scale(object.height, newPrintData['r1'], newPrintData['r2']) * object.scaleY);

  #         print2 = new Imagick();
  #         print2.setResolution(300, 300);
  #         print2.newImage(resizeWidth, resizeHeight, "transparent");
  #         print2.setImageVirtualPixelMethod(imagick::VIRTUALPIXELMETHOD_BACKGROUND);
  #         print2.setImageFormat('png32');
  #         print2.setImageUnits(imagick::RESOLUTION_PIXELSPERCENTIMETER);

  #         #Instantiate Imagick utility objects
  #         draw = new ImagickDraw();
  #         color = new ImagickPixel(object.fill);

  #         #starting_font_size = 100*1.33;
  #         font_size = ((object.fontSize * resizeWidth) / object.width);

  #         draw.setFontWeight((object.fontWeight == 'bold') ? 600 : 100 );
  #         draw.setFontStyle(0);
  #         draw.setFillColor(color);

  #         #Load Font 
  #         #font_size = starting_font_size;
  #         draw.setFont(fnt[object.fontFamily]);
  #         draw.setFontSize(font_size);

  #         draw.setTextAntialias(true);
  #         draw.setGravity(Imagick::GRAVITY_CENTER);

  #         if (object.stroke) {
  #             draw.setStrokeColor(object.stroke);
  #             draw.setStrokeWidth(object.strokeWidth);
  #             draw.setStrokeAntialias(true);  #try with and without
  #         }

  #         total_height = 0;

  #         #Run until we find a font size that doesn't exceed max_height in pixels
  #         while (0 == total_height || total_height > resizeHeight) {
  #             if (total_height > 0) {
  #                 font_size--; #we're still over height, decrement font size and try again
  #             }
  #             draw.setFontSize(font_size);

  #             #Calculate number of lines / line height
  #             #Props users Sarke / BMiner: http://stackoverflow.com/questions/5746537/how-can-i-wrap-text-using-imagick-in-php-so-that-it-is-drawn-as-multiline-text
  #             words = preg_split('%\s%', object.text, -1, PREG_SPLIT_NO_EMPTY);
  #             lines = array();
  #             i = 0;
  #             line_height = 0;

  #             while (count(words) > 0) {
  #                 metrics = print2.queryFontMetrics(draw, implode(' ', array_slice(words, 0, ++i)));
  #                 line_height = max(metrics['textHeight'], line_height);

  #                 if (metrics['textWidth'] > resizeWidth || count(words) < i) {
  #                     lines[] = implode(' ', array_slice(words, 0, --i));
  #                     words = array_slice(words, i);
  #                     i = 0;
  #                 }
  #             }

  #             total_height = count(lines) * line_height * line_height_ratio;

  #             if (total_height > 0) {

  #             }
  #         }
  #         #Writes text to image
  #         x_pos = 0;
  #         y_pos = 0;

  #         for (i = 0; i < count(lines); i++) {
  #             print2.annotateImage(draw, x_pos, y_pos + (i * line_height * line_height_ratio), object.angle, lines[i]);
  #         }

  #         if (object.flipX == 1)
  #             print2.flopImage(); #x
  #         if (object.flipY == 1)
  #             print2.flipImage(); #y

  #         print2.trimImage(0);
  #         print2.setImagePage(0, 0, 0, 0);

  #         print2.resizeImage(resizeWidth, 0, Imagick::FILTER_CATROM, 0.9, false);

  #         left = object.left < 0 ? -1 * abs(changeDpi(scale(object.left, newPrintData['r1'], newPrintData['r2']))) : changeDpi(scale(object.left, newPrintData['r1'], newPrintData['r2']));
  #         top = object.top < 0 ? -1 * abs(changeDpi(scale(object.top, newPrintData['r1'], newPrintData['r2']))) : changeDpi(scale(object.top, newPrintData['r1'], newPrintData['r2']));

  #         print.compositeImage(print2, Imagick::COMPOSITE_OVER, left, top);

  #         #header("Content-Type: image/png");
  #         #echo print2;exit;
  #     } catch (Exception e) {
  #         echo e.getMessage();
  #         exit();
  #     }
  # end

  #The greatest common divisor (GCD) 
  def gcd(a, b) 
      return b ? gcd(b, a % b) : a;
  end

  def changeDpi(px) 
      #return (px/96)*300;
      return px;
  end

  def scale(px, r1, r2) 
      return px * r1 / r2;
  end
end
