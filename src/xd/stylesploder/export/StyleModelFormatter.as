////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2008 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package xd.stylesploder.export
{

  import xd.stylesploder.model.PropertySet;
  import xd.stylesploder.model.StyleModel;
  import xd.stylesploder.model.StyleModelConstants;

  /**
   * A utility class to generate the formatted export string
   * @author brownlee
   */
  public class StyleModelFormatter
  {
    /**
     * Convert any modified style property sets into a CSS file string
     * @param model a <code>StyleModel</code> to export
     * @return
     *
     */
    public static function buildExportString(model:StyleModel):String
    {
      var result:String = buildHeader(model);

      for each (var propertySet:PropertySet in model.modifiedStyles)
      {
        result += StyleModelConstants.INDENT;
        result += propertySet.property;
        result += StyleModelConstants.PROPERTY_ASSIGNMENT;
        result += propertySet.value;
        result += StyleModelConstants.PROPERTY_DELIMITER;
        result += StyleModelConstants.NEWLINE;
      }

      result += StyleModelConstants.PROPETIES_BLOCK_END;
      result += StyleModelConstants.NEWLINE;

      return result;
    }

    protected static function buildHeader(model:StyleModel):String
    {
      var result:String = StyleModelConstants.NEWLINE;
      result += model.cssNamespace;
      result += StyleModelConstants.NAMESPACE_DELIMITER;
      result += model.cssElementName;
      result += StyleModelConstants.SPACE;
      result += StyleModelConstants.PROPETIES_BLOCK_START;
      result += StyleModelConstants.NEWLINE;
      return result;
    }
  }
}
