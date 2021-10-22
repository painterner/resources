interface Props {
  value?: string;
  onChange?: (v: string) => void;
  onSearch?: (v: string) => void;
  children?: React.ReactNode;
  style?: any;
  txtStyle?: any;
  containerStyle?: any;
  onPress?: () => void;
}

export interface SearchBarRef {
  setValue: any;
  value: string;
}

export const SearchBar = forwardRef(
  ({ ...props }: Props, ref: RefObject<SearchBarRef>) => {
    const [value, setValue] = useState("");

    useImperativeHandle(ref, () => ({
      setValue,
      value,
    }));
    useEffect(() => {
      setValue(props.value);
    }, [props.value]);

    return (
      <View style={[_styles.container, props.containerStyle]}>
        <AppInput
          value={value}
          onValueChange={props.onChange}
          onSubmitEditing={(e) =>
            props.onSearch && props.onSearch(e.nativeEvent.text)
          }
          floater={
            <>
              <View style={[_styles.searchIcon]}>
                <AppIcon name={{ name: "search", svg: true }}></AppIcon>
              </View>
              {!!value && (
                <View style={[_styles.closeIcon]}>
                  <AppIcon
                    name={{ name: "close", svg: true }}
                    onPress={() => props.onChange("")}
                  ></AppIcon>
                </View>
              )}
            </>
          }
          style={[_styles.inputContainer, props.style]}
          txtStyle={[_styles.search, props.txtStyle]}
        ></AppInput>
      </View>
    );
  }
);
