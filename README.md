# helm-charts

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/<chart.name>
```

You can install a chart release using the following command:

```bash
helm install <release> oci://codeberg.org/wrenix/helm-charts/<chart.name> --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall <release>
```
