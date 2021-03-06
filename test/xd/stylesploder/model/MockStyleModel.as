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

package xd.stylesploder.model
{

  public class MockStyleModel implements StyleModel
  {

    public static var EXPECTED_STYLE_OUTPUT:String = "DID NOT INIT";

    public static const MOCK_ELEMENT_NAME:String = "MockElement";

    public static const MOCK_NAMESPACE:String = "mock";

    public static var PROPERTY_ONE_NAME:String = "property-one"

    public static var PROPERTY_ONE_VALUE:String = "foo";

    public static var PROPERTY_TWO_NAME:String = "property-two"

    public static var PROPERTY_TWO_VALUE:String = "woohoo";

    private static var modifier:String;

    private static function initExpectedOutput():void
    {
      EXPECTED_STYLE_OUTPUT =
          StyleModelConstants.NEWLINE +
          MOCK_NAMESPACE +
          StyleModelConstants.NAMESPACE_DELIMITER +
          MOCK_ELEMENT_NAME +
          modifier +
          StyleModelConstants.SPACE +
          StyleModelConstants.PROPETIES_BLOCK_START +
          StyleModelConstants.NEWLINE +
          StyleModelConstants.INDENT +
          PROPERTY_ONE_NAME +
          StyleModelConstants.PROPERTY_ASSIGNMENT +
          PROPERTY_ONE_VALUE +
          StyleModelConstants.PROPERTY_DELIMITER +
          StyleModelConstants.NEWLINE +
          StyleModelConstants.INDENT +
          PROPERTY_TWO_NAME +
          StyleModelConstants.PROPERTY_ASSIGNMENT +
          PROPERTY_TWO_VALUE +
          StyleModelConstants.PROPERTY_DELIMITER +
          StyleModelConstants.NEWLINE +
          StyleModelConstants.PROPETIES_BLOCK_END +
          StyleModelConstants.NEWLINE;
    }

    private var _modifiedStyles:Array;

    public function MockStyleModel(nameModifier:String)
    {
      modifier = nameModifier;
      initExpectedOutput();
    }

    public function addModifiedStyle(value:PropertySet):void
    {
      if (value)
      {
        modifiedStyles.push(value);
      }
    }

    public function get cssElementName():String
    {
      return MOCK_ELEMENT_NAME + modifier;
    }

    public function get cssNamespace():String
    {
      return MOCK_NAMESPACE;
    }

    public function get modifiedStyles():Array
    {
      if (!_modifiedStyles)
      {
        _modifiedStyles = new Array();
      }
      return _modifiedStyles;
    }

    public function populate():void
    {

      var propertyOne:PropertySet = new StylePropertySet();
      propertyOne.property = MockStyleModel.PROPERTY_ONE_NAME;
      propertyOne.value = MockStyleModel.PROPERTY_ONE_VALUE;

      var propertyTwo:PropertySet = new StylePropertySet();
      propertyTwo.property = MockStyleModel.PROPERTY_TWO_NAME;
      propertyTwo.value = MockStyleModel.PROPERTY_TWO_VALUE;

      this.addModifiedStyle(propertyOne);
      this.addModifiedStyle(propertyTwo);

    }
  }
}
